#!/bin/sh

# uses svago export for all the heavy lifting
# install the flatpak from here:
# https://gitlab.gnome.org/jsparber/svago-export

flatpak run org.gnome.SvagoExport src/symbolic/gnome-stencils.svg
