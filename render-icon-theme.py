#!/usr/bin/env python

import os
import sys
import xml.sax
import subprocess

INKSCAPE = '/usr/bin/inkscape'
SRC = os.path.join('.', 'src')

inkscape_process = None

def wait_for_prompt(process, command=None):
    if command is not None:
        process.stdin.write(command+'\n')

    output = process.stdout.read(1)
    output += process.stdout.read(1)
    
    while output != "\n>":
        output = output[-1:]
        output += process.stdout.read(1)

def start_inkscape():
    process = subprocess.Popen([INKSCAPE, '--shell'], bufsize=0, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
    wait_for_prompt(process)
    return process

def inkscape_render_rect(icon_file, rect, output_file):
    global inkscape_process
    if inkscape_process is None:
        inkscape_process = start_inkscape()
    wait_for_prompt(inkscape_process, '%s -i %s -e %s' % (icon_file, rect, output_file))

class ContentHandler(xml.sax.ContentHandler):
    ROOT = 0
    SVG = 1
    LAYER = 2
    OTHER = 3
    TEXT = 4
    def __init__(self, path, force=False):
        self.stack = [self.ROOT]
        self.inside = [self.ROOT]
        self.path = path
        self.rects = []
        self.state = self.ROOT
        self.chars = ""
        self.force = force

    def endDocument(self):
        pass

    def startElement(self, name, attrs):
        if self.inside[-1] == self.ROOT:
            if name == "svg":
                self.stack.append(self.SVG)
                self.inside.append(self.SVG)
                return
        elif self.inside[-1] == self.SVG:
            if (name == "g" and attrs.has_key('inkscape:groupmode') and attrs.has_key('inkscape:label')
               and attrs['inkscape:groupmode'] == 'layer' and attrs['inkscape:label'] == 'baseplate'):
                self.stack.append(self.LAYER)
                self.inside.append(self.LAYER)
                self.context = None
                self.icon_name = None
                self.rects = []
                return
        elif self.inside[-1] == self.LAYER:
            if name == "text" and attrs.has_key('inkscape:label') and attrs['inkscape:label'] == 'context':
                self.stack.append(self.TEXT)
                self.inside.append(self.TEXT)
                self.text='context'
                self.chars = ""
                return
            elif name == "text" and attrs.has_key('inkscape:label') and attrs['inkscape:label'] == 'icon-name':
                self.stack.append(self.TEXT)
                self.inside.append(self.TEXT)
                self.text='icon-name'
                self.chars = ""
                return
            elif name == "rect":
                self.rects.append(attrs)

        self.stack.append(self.OTHER)


    def endElement(self, name):
        stacked = self.stack.pop()
        if self.inside[-1] == stacked:
            self.inside.pop()

        if stacked == self.TEXT and self.text is not None:
            assert self.text in ['context', 'icon-name']
            if self.text == 'context':
                self.context = self.chars
            elif self.text == 'icon-name':
                self.icon_name = self.chars
            self.text = None
        elif stacked == self.LAYER:
            assert self.icon_name
            assert self.context
            print '%s %s' % (self.context, self.icon_name)
            for rect in self.rects:
                width = rect['width']
                height = rect['height']
                id = rect['id']

                dir = os.path.join("gnome", "%sx%s" % (width, height), self.context)
                outfile = os.path.join(dir, self.icon_name+'.png')
                if not os.path.exists(dir):
                    os.mkdir(dir)
                # Do a time based check!
                if self.force or not os.path.exists(outfile):
                    inkscape_render_rect(self.path, id, outfile)
                    sys.stdout.write('.')
                else:
                    stat_in = os.stat(self.path)
                    stat_out = os.stat(outfile)
                    if stat_in.st_mtime > stat_out.st_mtime:
                        inkscape_render_rect(self.path, id, outfile)
                        sys.stdout.write('.')
                    else:
                        sys.stdout.write('-')
                sys.stdout.flush()
            sys.stdout.write('\n')
            sys.stdout.flush()

    def characters(self, chars):
        self.chars += chars.strip()

if len(sys.argv) == 1:
    if not os.path.exists('gnome'):
        os.mkdir('gnome')
    print 'Rendering from SVGs in %s' % SRC
    for file in os.listdir(SRC):
        if file[-4:] == '.svg':
            file = os.path.join(SRC, file)
            handler = ContentHandler(file)
            xml.sax.parse(open(file), handler)
else:
    file = os.path.join(SRC, sys.argv[1] + '.svg')
    if os.path.exists(os.path.join(file)):
        handler = ContentHandler(file, True)
        xml.sax.parse(open(file), handler)
    else:
        print "Error: No such file %s" % file
        sys.exit(1)


