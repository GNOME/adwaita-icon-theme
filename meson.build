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
  exclude_directories: ['cursors'],
  strip_directory : true
)

command_output = run_command('tools/find_cursors_win32.py', check: true)
win32_cursors = command_output.stdout().strip().split('\n')
if host_machine.system() != 'windows'
  cursors_with_rel_path = []
  foreach cursor : win32_cursors
    cursors_with_rel_path += f'Adwaita/cursors/@cursor@'
  endforeach
  install_data(
    cursors_with_rel_path,
    install_dir: get_option('datadir') / 'icons' / 'Adwaita',
    preserve_path: true
  )
else
  install_subdir(
    'Adwaita/cursors',
    install_dir: get_option('datadir') / 'icons' / 'Adwaita',
    exclude_files: win32_cursors,
  )
endif

# Post install

find_program(['gtk4-update-icon-cache', 'gtk-update-icon-cache'], required : true)
meson.add_install_script('tools/update_icon_cache.py')
