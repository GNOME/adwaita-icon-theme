# Script to replace @THEME_DIRS@ with the directories for the icons

import os
import sys
import argparse

from replace import replace, check_required_args
from dir_list import icon_dirs

def main(argv):
    parser = argparse.ArgumentParser(description='Replace @THEME_DIRS@')
    parser.add_argument('-i', '--input', help='Input file')
    parser.add_argument('-o', '--output', help='Output file')
    args = parser.parse_args()

    check_required_args(args, ['input','output'])

    replace(args.input, args.output, '@THEME_DIRS@', ','.join(icon_dirs) + ',')

if __name__ == '__main__':
    sys.exit(main(sys.argv))