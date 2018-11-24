Bugs and Requests
-----------------

Requests for icons that will be useful for more than a a single
application and it makes sense to share it in an icon theme should be
filed in GNOME bugzilla (bugzilla.gnome.org) under the
gnome-icon-theme module.


High resolution icons
=====================

Application launcher icons and filetype icons in general will benefit
in providing a high resolution variant. For Tango, the canvas size is
256x256 pixels.

We suggest creating artwork for this large canvas as vectors. It may
require more time as vector art with filter effects tends to be very
computentionally intensive, but the benefit is that it allows to
create derivative works easily.  In addition, if we need a higher
resolution than 256x256 in future, it's simply a matter of
re-rendering the icons.

Due to the large canvas a lot of the guidelines discussed elsewhere in
this document do not apply. What still stands is the use of colors,
the perspective and lighting.

FIXME: outlines (strokes alternative - wip)
FIXME: highlights (inner stroke alternative)
FIXME: shadows (wip)

Inkscape workflow tips:
-----------------------

* The 256x256 icon needs to be nice when scaled down to 64x64 (25%
  zoom), so, in inkscape, it's necessary to use a 1x1 pixels grid with
  major lines every 4. Lining up the main objects to the major lines
  of the grid will help making the icon less blurry when scaled down.

* Text: the best trick we found (atm) for text in high resolution
  icons is to use the text tool to write something (lorem ipsum, funny
  things, nonsenses and so on:-)) using the Bitstream Vera Sans
  typeface with a 6pt size, trying to have the main bodies of the
  letters between two horizontal major grid lines, then we convert the
  text object to path and simplify (ctrl+l) 3 times. In case the text
  is not visible enough when scaling down overlaying the line with a
  very subtle rectangle 4px tall will help (see text-x-generic).

* Outlines: to make the things stand out we darken the edges using
  various tecniques. Lapo's favourite is to group the all objects
  costituting the shape; copy, paste in place, ungroup and make the
  boolean union to obtain the silouhette [ctrl+c, crtl+alt+v, ctrl+u,
  ctrl++]; copy again; set this path fill to none, set the stroke from
  0.5 to 2 pixels in a dark color (usaully black) and set blur from 1
  to 2 points; group it with the previous group; paste in place and
  select the new group and the pasted path apply a clipping mask (the
  pasted path will be used as a clipping mask) [Object -> Clip ->
  Set]. Now you can do group editing with the clipping mask in place
  [ctrl+enter to "enter" the group]. You can play with various stroke
  width and color or gradients and with different blur settings.

* Shadows: there's usually two shadow objects, one darker, less
  blurred, less offset. The other very fuzzy, very transparent. So you
  get a nice soft, non-linear falloff.

Symbolic Icons
==============

Purpose of this icon theme is to extend the base icon theme that
follows the Tango style guidelines for specific purposes. This would
include OSD messages, panel system/notification area, and possibly
menu icons.

Icons follow the naming specification, but have a -symbolic suffix, so
only applications specifically looking up these symbolic icons will
render them. If a -symbolic icon is missing, the app will fall back to
the regular name.

Primitive build instructions
============================

Running the r.rb script will chop up the "source" SVG into individual
icons. Part of the process is converting paths strokes into
objects. This is for the external stylesheet to work at gtk3
runtime. This means objects that rely on this conversion need to be
undgrouped inside the master group.

Targets
=======

Here's places that should make use of this style (and look up icons as
-symbolic).

	* Panel systray (and gnome-shell equivalents)
	* Nautilus' sidebar eject emblem for mounted drives
	* OSD (volume levels, display, eject etc)
	* text input widgets (caps lock warning, clear icons)

HOWTO
=====

The whole set is maintained in a single SVG,
src/gnome-stencils.svg. Each context (apps, actions, mimetypes...)
lives inside an Inkscape layer (group).  Any group inside that layer
is treated as an icon and will be exported into the
gnome/scalable/<context>/<inkscape:label>-symbolic.svg of the
group. This export is handled by using Inkscape's verbs, which means
it will pop up Inkscape GUI at you and will take ages.

The best way to assure your icon will be precisely 16x16, is to
include a blank rectangle in the group. This rectangle, as long as it
is 16 pixels wide and high, will be removed by the crop script. To
name the group, open up the object properties dialog (Ctrl+Shfit+O)
and use the 'label' field. Do not add the -symbolic suffix there, that
will be done by the script. Also, don't nest groups too much inside
the main one. The script will only convert outlines properly down to
two subgroups.

Recoloring
----------

The color of the icon set is defined at runtime by the gtk
theme. Every single icon from the set is actually embedded inside an
xml container that has a stylesheet overriding the colors.

There is a couple of things the icon author needs to be aware of and a few
things s/he can make use of. The stylesheet is setting the color of the fill
for all rectangles and paths. _DO_NOT_ leave any rectangles or paths
with no fill/stroke thinking it's invisible.

Note that the export script in gnome-icon-theme-symbolic will convert
strokes to paths, so you will need to do this manually (Path -> Stroke
to Path in inkscape) if you ship an icon outside of
gnome-icon-theme-symbolic.

If you need colorize specific part of an icon you need to set a class
of that object. In inkscape 0.47 this is sadly only achievable by
selecting the object, going into the xml editor and creating a new
attribute 'class' and setting its value. There are currently 3
possible values:

- warning - this maps to gtk @warning_color
- error - maps to @error_color
- success - maps to @success_color

