project('adwaita-icon-theme', 'c', version : '44.0', meson_version : '>= 0.64.0')
cc = meson.get_compiler('c')

gnome = import('gnome')

pc_conf = configuration_data()
pc_conf.set_quoted('VERSION', meson.project_version())
configure_file(
  input : 'adwaita-icon-theme.pc.in',
  output : 'adwaita-icon-theme.pc',
  configuration : pc_conf,
)
pkgconfig_dir = get_option('datadir') / 'pkgconfig'
#FIXME: temporarily skip installing .pc that isn't getting generated
#install_data('adwaita-icon-theme.pc', install_dir: pkgconfig_dir, install_tag: 'pkgconfig')

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
