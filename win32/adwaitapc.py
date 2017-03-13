#!/usr/bin/python
#
# Utility script to generate .pc files for libsoup
# for Visual Studio builds, to be used for
# building introspection files

# Author: Fan, Chun-wei
# Date: March 10, 2016

import os
import sys

from replace import replace_multi
from pc_base import BasePCItems

def main(argv):
    base_pc = BasePCItems()

    base_pc.setup(argv)

    # Generate adwaita-icon-theme.pc
    replace_multi(base_pc.top_srcdir + '/adwaita-icon-theme.pc.in',
                  base_pc.srcdir + '/adwaita-icon-theme.pc',
                  base_pc.base_replace_items)

if __name__ == '__main__':
    sys.exit(main(sys.argv))
