project('adwaita-icon-theme', version : '49.0', meson_version : '>= 0.64.0')

pkg = import('pkgconfig')
pkg.generate(
  name : 'adwaita-icon-theme',
  description : 'A collection of icons used as the basis for GNOME themes',
  dataonly : true,
)

licenses_dir = get_option('datadir') / 'licenses' / 'adwaita-icon-theme'
install_data('COPYING', install_dir : licenses_dir, install_tag : 'runtime')
install_data('COPYING_CCBYSA3', install_dir : licenses_dir, install_tag : 'runtime')
install_data('COPYING_LGPL', install_dir : licenses_dir, install_tag : 'runtime')

adwaita_dir = get_option('datadir') / 'icons' / 'Adwaita'
install_data('index.theme', install_dir : adwaita_dir, install_tag : 'runtime')

install_subdir(
  'Adwaita',
  install_dir: adwaita_dir,
  exclude_directories: ['cursors'],
  strip_directory : true,
  install_tag : 'runtime',
)

command_output = run_command('tools/find_cursors_win32.py', check: true)
win32_cursors = command_output.stdout().strip().split('\n')
if host_machine.system() == 'windows'
  cursors_with_rel_path = []
  icons_dir = get_option('datadir') / 'icons'
  foreach cursor : win32_cursors
    cursors_with_rel_path += f'Adwaita/cursors/@cursor@'
  endforeach
  install_data(
    cursors_with_rel_path,
    install_dir: icons_dir,
    preserve_path: true,
    install_tag : 'runtime',
  )
else
  install_subdir(
    'Adwaita/cursors',
    install_dir: adwaita_dir,
    exclude_files: win32_cursors,
    install_tag : 'runtime',
  )
  cursor_symlinks = {
    # Each one is of the form:
    # 'css-name': ['x11-name', 'x11-name', ...],

    'all-resize': ['fleur'],
    'crosshair': ['cross', 'cross_reverse', 'diamond_cross', 'tcross'],
    'context-menu': ['dnd-ask'],

    # move and dnd-move are separate contexts
    # https://gitlab.gnome.org/GNOME/adwaita-icon-theme/-/issues/286
    'default': ['arrow', 'dnd-move', 'left_ptr', 'top_left_arrow', 'move'],

    'e-resize': ['right_side'],
    'ew-resize': ['sb_h_double_arrow'],
    'grab': ['hand1'],
    'help': ['question_arrow'],
    'n-resize': ['top_side'],
    'ne-resize': ['top_right_corner'],
    'nesw-resize': ['fd_double_arrow'],
    'ns-resize': ['sb_v_double_arrow'],
    'nw-resize': ['top_left_corner'],
    'nwse-resize': ['bd_double_arrow'],
    'pointer': ['hand2'],
    's-resize': ['bottom_side'],
    'se-resize': ['bottom_right_corner'],
    'sw-resize': ['bottom_left_corner'],
    'text': ['xterm'],
    'w-resize': ['left_side'],
    'wait': ['watch'],

  }
  foreach src, dests : cursor_symlinks
    # This acts as an assertion that the src is a cursor that exists
    files('Adwaita' / 'cursors' / src)

    foreach dest : dests
      install_symlink(
        dest,
        install_dir: adwaita_dir / 'cursors',
        install_tag: 'runtime',
        pointing_to: src,
      )
    endforeach
  endforeach
endif

gtk_update_icon_cache = find_program(
  'gtk4-update-icon-cache',
  'gtk-update-icon-cache',
  required : true,
)
meson.add_install_script(
  gtk_update_icon_cache,
  '-qtf',
  get_option('prefix') / adwaita_dir,
  skip_if_destdir: true,
)
