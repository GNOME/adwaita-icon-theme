project('adwaita-icon-theme', 'c', version : '44.0', meson_version : '>= 0.64.0')
cc = meson.get_compiler('c')

gnome = import('gnome')

pkg = import('pkgconfig')
pkg.generate(
  name : 'adwaita-icon-theme',
  description : 'A collection of icons used as the basis for GNOME themes',
  dataonly : true,
)

licenses_dir = get_option('datadir') / 'licenses' / 'adwaita-icon-theme'
install_data('COPYING', install_dir: licenses_dir, install_tag: 'license')
install_data('COPYING_CCBYSA3', install_dir: licenses_dir, install_tag: 'license')
install_data('COPYING_LGPL', install_dir: licenses_dir, install_tag: 'license')

install_data('index.theme', install_dir: get_option('datadir') / 'icons' / 'Adwaita', install_tag: 'index')

subdir('Adwaita')

icon_theme_cache = get_option('datadir') / 'icons' / 'hicolor' / '.icon-theme.cache'
fs = import('fs')
if fs.is_file(icon_theme_cache)
  gnome.post_install(
    gtk_update_icon_cache: true,
  )
endif
