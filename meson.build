project('adwaita-icon-theme', version : '45.0', meson_version : '>= 0.64.0')

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
  foreach cursor : win32_cursors
    cursors_with_rel_path += f'Adwaita/cursors/@cursor@'
  endforeach
  install_data(
    cursors_with_rel_path,
    install_dir: adwaita_dir,
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
    'X_cursor': ['pirate'],
    'bd_double_arrow': ['c7088f0f3e6c8088236ef8e1e3e70000', 'nwse-resize', 'size_fdiag'],
    'bottom_left_corner': ['sw-resize'],
    'bottom_right_corner': ['se-resize'],
    'bottom_side': ['s-resize'],
    'dnd-copy': ['1081e37283d90000800003c07f3ef6bf', '6407b0e94181790501fd1e167b474872', 'copy'],
    'dnd-link': ['alias'],
    'dnd-no-drop': ['no-drop'],
    'dotbox': ['dot_box_mask', 'draped_box', 'icon', 'target'],
    'fd_double_arrow': ['fcf1c3c7cd4491d801f1e1c78f100000', 'nesw-resize', 'size_bdiag'],
    'cross': ['cross_reverse', 'crosshair', 'diamond_cross'],
    'crossed_circle': ['03b6e0fcb3499374a867c041f52298f0', 'not-allowed'],
    'hand1': ['grab', 'openhand'],
    'hand2': ['9d800788f1b08800ae810202380a0822', 'e29285e634086352946a0e7090d73106', 'hand', 'pointer'],
    'left_ptr': ['arrow', 'default', 'top_left_arrow'],
    'left_ptr_watch': ['08e8e1c95fe2fc01f976f1e063a24ccd', '3ecb610c1bf2410f44200f48c40d3599', 'progress'],
    'left_side': ['w-resize'],
    'link': ['3085a0e285430894940527032f8b26df', '640fb0e74195791501fd1ed57b41487f'],
    'move': ['4498f0e0c1937ffe01fd06f973665830', '9081237383d90e509aa00f00170e968f', 'fleur', 'size_all'],
    'question_arrow': ['5c6cd98b3f3ebcb1f9c7f1c204630408', 'd9ce0ab605698f320427677b458ad60b', 'help', 'left_ptr_help'],
    'right_ptr': ['draft_large', 'draft_small'],
    'right_side': ['e-resize'],
    'sb_h_double_arrow': ['028006030e0e7ebffc7f7070c0600140', '14fef782d02440884392942c11205230', 'col-resize', 'ew-resize', 'h_double_arrow', 'size_hor'],
    'sb_v_double_arrow': ['00008160000006810000408080010102', '2870a09082c103050810ffdffffe0204', 'double_arrow', 'ns-resize', 'row-resize', 'size_ver', 'v_double_arrow'],
    'top_side': ['n-resize'],
    'top_left_corner': ['nw-resize'],
    'top_right_corner': ['ne-resize'],
    'watch': ['wait'],
    'xterm': ['text'],
  }
  foreach src, dests : cursor_symlinks
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
