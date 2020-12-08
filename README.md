# Adwaita Icon Theme


## Bugs and Requests
If you're a core GNOME application maintainer and you have an icon need that bridges multiple components or apps, feel free to file a request in the [issue tracker](https://gitlab.gnome.org/GNOME/adwaita-icon-theme/-/issues). If you're an application developer, file a request against the [Icon Development Kit](https://gitlab.gnome.org/Teams/Design/icon-development-kit/-/issues) instead.


## Fullcolor vs symbolic
For an up to date guide on how to use and how to design GNOME style icons, see the [GNOME User Interface Guidelines](https://developer.gnome.org/hig/stable/icons-and-artwork.html.en).

## Building and Contributing to Adwaita
If you have experience designing symbolic icons for 3rd party GNOME apps and would like to help maintaining `adwaita-icon-theme`, here's a few tips on how to get going and how it differs from the [Devkit](https://gitlab.gnome.org/Teams/Design/icon-development-kit).

Just like larger assets in the [Icon Devkit](https://gitlab.gnome.org/Teams/Design/icon-development-kit) or apps relying on [Symbolic Preview](https://gitlab.gnome.org/World/design/symbolic-preview), the set is maintained in a single SVG,
`src/gnome-stencils.svg`. There are many similarities. The icons are grouped in inkscape layes per icon context (`apps`, `actions`, `mimetypes`…)
lives inside an Inkscape layer (group).  Any group inside that layer
is treated as an icon and will be exported into the
`gnome/scalable/<context>/<inkscape:label>-symbolic.svg` of the
group. This export is handled by using Inkscape's verbs, which means
it will pop up Inkscape GUI at you and will take ages.

The best way to assure your icon will be precisely 16x16, is to
include a blank rectangle in the group. This rectangle, as long as it
is 16 pixels wide and high, will be removed by the crop script. To
name the group, open up the object properties dialog (`Ctrl+Shfit+O`)
and use the 'label' field. Do not add the `-symbolic` suffix there, that
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
for all rectangles and paths. **DO NOT** leave any rectangles or paths
with no fill/stroke thinking it's invisible.

Note that the export script in `gnome-icon-theme-symbolic` will convert
strokes to paths, so you will need to do this manually (Path -> Stroke
to Path in inkscape) if you ship an icon outside of
`gnome-icon-theme-symbolic`.

If you need colorize specific part of an icon you need to set a class
of that object. In inkscape 0.47 this is sadly only achievable by
selecting the object, going into the xml editor and creating a new
attribute 'class' and setting its value. There are currently 3
possible values:

- warning - this maps to gtk `@warning_color`
- error - maps to `@error_color`
- success - maps to `@success_color`

[1]: https://gitlab.gnome.org/GNOME/adwaita-icon-theme/issues