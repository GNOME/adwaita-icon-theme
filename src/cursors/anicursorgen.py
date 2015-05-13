#!/usr/bin/python2
# -*- coding: utf-8 -*-
# anicursorgen
# Copyright (C) 2015 Руслан Ижбулатов <lrn1986@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
from __future__ import print_function

import sys
import os
import argparse
import shlex
import io
import struct
from PIL import Image

p = struct.pack

program_name = 'anicursorgen'
program_version = 1.0

def main ():
  parser = argparse.ArgumentParser (description='Creates .ani or .cur files from separate images and input metadata.',
                        add_help=False)
  parser.add_argument ('-V', '--version', action='version', version='{}-{}'.format (program_name, program_version),
                       help='Display the version number and exit.')
  parser.add_argument ('-h', '-?', action='help',
                       help='Display the usage message and exit.')
  parser.add_argument ('-p', '--prefix', metavar='dir', default=None,
                       help='Find cursor images in the directory specified by dir. If not specified, the current directory is used.')

  parser.add_argument ('input_config', default='-', metavar='input-config [output-file]', nargs='?',
                       help='Input config file (stdin by default).')
  parser.add_argument ('output_file', default='-', metavar='', nargs='?',
                       help='Output cursor file (stdout by default).')

  args = parser.parse_args ()

  if args.prefix is None:
    args.prefix = os.getcwd ()

  if args.input_config == '-':
    input_config = sys.stdin
  else:
    input_config = open (args.input_config, 'rb')

  if args.output_file == '-':
    output_file = sys.stdout
  else:
    output_file = open (args.output_file, 'wb')

  result = make_cursor_from (input_config, output_file, args.prefix)

  input_config.close ()
  output_file.close ()

  return result

def make_cursor_from (inp, out, prefix):
  frames = parse_config_from (inp, prefix)

  animated = frames_have_animation (frames)

  if animated:
    result = make_ani (frames, out)
  else:
    buf = make_cur (frames)
    copy_to (out, buf)
    result = 0

  return result

def copy_to (out, buf):
  buf.seek (0, io.SEEK_SET)
  while True:
    b = buf.read (1024)
    if len (b) == 0:
      break
    out.write (b)

def frames_have_animation (frames):
  sizes = set ()

  for frame in frames:
    if frame[4] == 0:
      continue
    if frame[0] in sizes:
      return True
    sizes.add (frame[0])

  return False

def make_cur (frames):
  buf = io.BytesIO ()
  buf.write (p ('<HHH', 0, 2, len (frames)))
  frame_offsets = []
  for frame in frames:
    width = frame[0]
    if width > 255:
      width = 0
    height = width
    buf.write (p ('<BBBB HH', width, height, 0, 0, frame[1], frame[2]))
    size_offset_pos = buf.seek (0, io.SEEK_CUR)
    buf.write (p ('<II', 0, 0))
    frame_offsets.append ([size_offset_pos])

  for i, frame in enumerate (frames):
    frame_offset = buf.seek (0, io.SEEK_CUR)
    frame_offsets[i].append (frame_offset)

    compressed = frame[0] > 48

    if compressed:
      write_png (buf, frame)
    else:
      write_cur (buf, frame)

    frame_end = buf.seek (0, io.SEEK_CUR)
    frame_offsets[i].append (frame_end - frame_offset)

  for frame_offset in frame_offsets:
    buf.seek (frame_offset[0])
    buf.write (p ('<II', frame_offset[2], frame_offset[1]))

  return buf

def make_framesets (frames):
  framesets = []
  sizes = set ()

  # This assumes that frames are sorted
  size = 0
  for i, frame in enumerate (frames):
    if size == 0 or frame[0] != size:
      size = frame[0]
      counter = 0

      if size in sizes:
        print ("Frames are not sorted: frame {} has size {}, but we have seen that already".format (i, size), file=sys.stderr)
        return None

      sizes.add (size)

    if counter >= len (framesets):
      framesets.append ([])

    framesets[counter].append (frame)
    counter += 1

  for i in range (1, len (framesets)):
    if len (framesets[i - 1]) != len (framesets[i]):
      print ("Frameset {} has size {}, expected {}".format (i, len (framesets[i]), len (framesets[i - 1])), file=sys.stderr)
      return None

  for frameset in framesets:
    for i in range (1, len (frameset)):
      if frameset[i - 1][4] != frameset[i][4]:
        print ("Frameset {} has duration {} for framesize {}, but {} for framesize {}".format (i, frameset[i][4], frameset[i][0], frameset[i - 1][4], frameset[i - 1][0]), file=sys.stderr)
        return None

  return framesets

def make_ani (frames, out):
  framesets = make_framesets (frames)
  if framesets is None:
    return 1

  buf = io.BytesIO ()

  buf.write (b'RIFF')
  riff_len_pos = buf.seek (0, io.SEEK_CUR)
  buf.write (p ('<I', 0))
  riff_len_start = buf.seek (0, io.SEEK_CUR)

  buf.write (b'ACON')
  buf.write (b'anih')
  buf.write (p ('<IIIIIIIIII', 36, 36, len (framesets), len (framesets), 0, 0, 32, 1, framesets[0][0][4], 0x01))

  rates = set ()
  for frameset in framesets:
    rates.add (frameset[0][4])

  if len (rates) != 1:
    buf.write (b'rate')
    buf.write (p ('<I', len (framesets) * 4))
    for frameset in framesets:
      buf.write (p ('<I', frameset[0][4]))

  buf.write (b'LIST')
  list_len_pos = buf.seek (0, io.SEEK_CUR)
  buf.write (p ('<I', 0))
  list_len_start = buf.seek (0, io.SEEK_CUR)

  buf.write (b'fram')

  for frameset in framesets:
    buf.write (b'icon')
    cur = make_cur (frameset)
    cur_size = cur.seek (0, io.SEEK_END)
    aligned_cur_size = cur_size
    #if cur_size % 4 != 0:
    #  aligned_cur_size += 4 - cur_size % 2
    buf.write (p ('<i', cur_size))
    copy_to (buf, cur)
    pos = buf.seek (0, io.SEEK_END)
    if pos % 2 != 0:
      buf.write ('\x00' * (2 - (pos % 2)))

  end_at = buf.seek (0, io.SEEK_CUR)
  buf.seek (riff_len_pos, io.SEEK_SET)
  buf.write (p ('<I', end_at - riff_len_start))
  buf.seek (list_len_pos, io.SEEK_SET)
  buf.write (p ('<I', end_at - list_len_start))

  copy_to (out, buf)

  return 0

def write_png (out, frame):
  with open (frame[3], 'rb') as src:
    while True:
      buf = src.read (1024)
      if buf is None or len (buf) == 0:
        break
      out.write (buf)

def write_cur (out, frame):
  img = Image.open (frame[3])
  pixels = img.load ()

  out.write (p ('<I II HH IIIIII', 40, frame[0], frame[0] * 2, 1, 32, 0, 0, 0, 0, 0, 0))

  for y in reversed (range (frame[0])):
    for x in range (frame[0]):
      pixel = pixels[x, y]
      out.write (p ('<BBBB', pixel[2], pixel[1], pixel[0], pixel[3]))

  acc = 0
  acc_pos = 0
  for y in reversed (range (frame[0])):
    wrote = 0
    for x in range (frame[0]):
      if pixels[x, y][3] <= 127:
        acc = acc | (1 << acc_pos)
      acc_pos += 1
      if acc_pos == 8:
        acc_pos = 0
        out.write (chr (acc))
        wrote += 1
    if wrote % 4 != 0:
      out.write (b'\x00' * (4 - wrote % 4))

def parse_config_from (inp, prefix):
  frames = []

  for line in inp.readlines ():
    words = shlex.split (line.rstrip ('\n').rstrip ('\r'))

    if len (words) < 4:
      continue

    try:
      size = int (words[0])
      hotx = int (words[1]) - 1
      hoty = int (words[2]) - 1
      filename = words[3]
      if not os.path.isabs (filename):
        filename = prefix + '/' + filename
    except:
      continue

    if len (words) > 4:
      try:
        duration = int (words[4])
      except:
        continue
    else:
      duration = 0

    frames.append ((size, hotx, hoty, filename, duration))

  return frames

if __name__ == '__main__':
  sys.exit (main ())
