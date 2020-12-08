# Adwaita Icon Theme
![Adwaita Icons](src/logo.svg)

## Bugs and Requests
If you're a core GNOME application maintainer and you have an icon need that bridges multiple components or apps, feel free to file a request in the [issue tracker](https://gitlab.gnome.org/GNOME/adwaita-icon-theme/-/issues). If you're an application developer, file a request against the [Icon Development Kit](https://gitlab.gnome.org/Teams/Design/icon-development-kit/-/issues) instead.


## Fullcolor vs symbolic
For an up to date guide on how to use and how to design GNOME style icons, see the [GNOME User Interface Guidelines](https://developer.gnome.org/hig/stable/icons-and-artwork.html.en).

## Building and Contributing to Adwaita
If you have experience designing symbolic icons for 3rd party GNOME apps and would like to help maintaining `adwaita-icon-theme`, here's a few tips on how to get going and how it differs from the [Devkit](https://gitlab.gnome.org/Teams/Design/icon-development-kit).

Just like larger assets in the [Icon Devkit](https://gitlab.gnome.org/Teams/Design/icon-development-kit) or apps relying on [Symbolic Preview](https://gitlab.gnome.org/World/design/symbolic-preview), the set is maintained in a single SVG,
`src/gnome-stencils.svg`. There are many similarities. The icons are grouped in inkscape layes per icon context (`apps`, `actions`, `mimetypes`…).  Any group inside that layer
is treated as an icon and will be exported into the
`Adwaita/scalable/<context>/<inkscape:label>-symbolic.svg` of the group. Notice the export *size* is `scalable` rather than `symbolic` for legacy reasons. 

The best way to assure your icon will be precisely 16x16px, is to
include a blank rectangle in the group. This rectangle, as long as it is 16 pixels wide and high, will be removed by the crop script. To name the group, open up the object properties dialog (`Ctrl+Shfit+O`) and use the `label` field. This, again, i different to devkit, where every icon needs a `title` instead. Do not add the `-symbolic` suffix there, that will be done by the script. Also, don't nest groups too much inside the main one. The script will only convert outlines properly down to two subgroups.

### Recoloring
The color of the icon set is defined at runtime by the gtk theme. Every single icon from the set is actually embedded inside an xml container that has a stylesheet overriding the colors.

There is a couple of things the icon author needs to be aware of and a few things s/he can make use of. The stylesheet is setting the color of the fill for all rectangles and paths. **DO NOT** leave any rectangles or paths with no fill/stroke thinking it's invisible.

While the script is set to convert strokes to paths, you might be safer to do this manually (`Path -> Stroke to Path` in *Inkscape*).

gtk doesn't care about the colors you define for the icon. They are recolored at runtime. If you need portions of icons to have a color, you need to include a `class` attribute to the shape or group and set it to one of the three values below. 

- `warning` - this maps to gtk `@warning_color`
- `error` - maps to `@error_color`
- `success` - maps to `@success_color`