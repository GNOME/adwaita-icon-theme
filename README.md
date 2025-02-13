# Adwaita Icon Theme
Private UI icon set for GNOME core apps.

![Adwaita Icons](src/logo.svg)

## Bugs and Requests
If you're a core GNOME application maintainer (`Files` and `gnome-shell`, really) and you have an icon need that bridges multiple components or apps, feel free to file a request in the [issue tracker](https://gitlab.gnome.org/GNOME/adwaita-icon-theme/-/issues). If you're an application developer, file a request against the [Icon Development Kit](https://gitlab.gnome.org/Teams/Design/icon-development-kit/-/issues) instead.


## Fullcolor vs symbolic
For an up to date guide on how to use and how to design GNOME style icons, see the GNOME User Interface Guidelines: [UI Icons](https://developer.gnome.org/hig/guidelines/ui-icons.html) and [App Icons](https://developer.gnome.org/hig/guidelines/app-icons.html).

## Building and Contributing to Adwaita
The icon set for system components shares the same workflow as 3rd party app symbolics, the [icon devkit](https://gitlab.gnome.org/Teams/Design/icon-development-kit). Icon devkit provides more detailed guidelines on the symbolic style.

While many legacy symbolics only live as the exported individual SVGS in `Adwaita/symbolic/`, the replacements are maintained in `src/symbolic/core.svg`. Using icon categories/contexts are [no longer used](https://gitlab.gnome.org/GNOME/adwaita-icon-theme/-/issues/73) and all new icons go into `actions`. Please refer to the [Devkit guidelines](https://gitlab.gnome.org/Teams/Design/icon-development-kit) on how to structure the metadata.

Do note that no new additions should be made unless very thoroughly discussed. *a-i-t* is the wrong way to reuse icon assets (no API, false promise of stability).

### Recoloring
The color of the icon set is defined at runtime by [gtk](https://gtk.org). Every single icon from the set is actually embedded inside an xml container that has a stylesheet overriding the colors.

There is a couple of things the icon author needs to be aware of and a few things they can make use of. The stylesheet is setting the color of the fill for all rectangles and paths. **DO NOT** leave any rectangles or paths with no fill/stroke thinking it's invisible.

[Symbolic Preview](https://flathub.org/apps/details/org.gnome.design.SymbolicPreview) doesn't convert strokes to paths yet, so you need to do it manually for now in Inkscape (`Path -> Stroke to Path`). Alternatively you can add Live path effect `join type` to your stroke and keep it non destructive.

Gtk doesn't care about the colors you define for the icon. They are recolored at runtime. If you need portions of icons to have a color, you need to include a `class` attribute to the shape or group and set it to one of the three values below. 

- `warning` - this maps to gtk `@warning_color`
- `error` - maps to `@error_color`
- `success` - maps to `@success_color`

### Cursor generation

Cursors are in the xcursorgen format. They come in multiple sizes and possibly animation frames per file. Generating them is a two sstep process. 

First step is to render the source svg into multiple pngs. This is done with the `renderpngs.py` script. It takes the adwaita.svg file and generates the pngs for the different sizes and saves them in the `pngs/` directory.

The cursors are then generated using the `cursorgen.py` script. The `cursors.py` file contains a dictionary that maps the cursor name to the *cursor info* files such as `pngs/default.in`. The *cursor info* is a dictionary that contains the hotspot, frames, and duration. If the cursor is animated, the duration is the milliseconds each frame takes.

Coordinates of the hotspots are only specified for the nominal 24x24 size. The script scales the coordinates to the different sizes and generates the cursors for the different sizes.

The `cursorgen.py` script generates the cursors for the different sizes and saves them in the `Adwaita/cursors/` directory.
