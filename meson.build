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

install_subdir(
  'Adwaita',
  install_dir: get_option('datadir') / 'icons' / 'Adwaita',
  exclude_files: ['meson.build'],
  exclude_directories: ['cursors'],
  strip_directory : true
)
subdir('Adwaita')

# Post install

find_program(['gtk4-update-icon-cache', 'gtk-update-icon-cache'], required : true)
meson.add_install_script('tools/update_icon_cache.py')
