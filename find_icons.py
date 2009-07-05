#! /usr/bin/env python
"""
License: Public Domain

This scans the directory to find all icon files in an icon theme. It has an
hardcoded list of directories to search. The scalable directory (if found)
is assumed to contain 48x48 icons.
"""

import os
import os.path
import sys


def find_icons(theme_path):
    icons = {}

    for size_dir in ['16x16', '22x22', '32x32', 'scalable', '48x48']:
        size = size_dir
        if size_dir == 'scalable':
            size = "48x48"

        if not os.path.exists(os.path.join(theme_path, size_dir)):
            continue

        for context in os.listdir(os.path.join(theme_path, size_dir)):
            dir = os.path.join(theme_path, size_dir, context)

            if not os.path.isdir(dir):
                continue
            
            for icon in os.listdir(dir):
                if icon[-4:] == ".svg":
                    if not icons.has_key((icon[0:-4], context)):
                        icons[(icon[0:-4], context)] = {}
                    
                    icons[(icon[0:-4], context)][size] = os.path.join(dir, icon)

                if icon[-4:] == ".png":
                    if not icons.has_key((icon[0:-4], context)):
                        icons[(icon[0:-4], context)] = {}

                    if not size in icons[(icon[0:-4], context)]:
                        icons[(icon[0:-4], context)][size] = os.path.join(dir, icon)

    return icons


if __name__ == '__main__':
    import pprint
    icons = find_icons(sys.argv[1])
    pprint.pprint(icons)
    print "Number: %i" % len(icons)
    
