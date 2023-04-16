project('adwaita-icon-theme', 'c', version : '44.0')
cc = meson.get_compiler('c')

themedir = get_option('prefix') / 'share' / 'icons' / 'Adwaita'
SVGOUTDIR = 'Adwaita'
symbolic_render_sizes = []
install_sizes = ['16x16', 'scalable']

gtk_update_icon_cache = find_program('gtk-update-icon-cache')

themedir_def = '-Dthemedir=' + themedir
gettext_package = 'adwaita-icon-theme'

configure_file(
  input : 'adwaita-icon-theme.pc.in',
  output : 'adwaita-icon-theme.pc',
  configuration : {
    'themedir' : themedir_def,
    'GETTEXT_PACKAGE' : gettext_package,
  },
)


configure_file(input: 'index.theme.in', output: 'index.theme', install_dir: get_option('datadir'), copy: true)

win32_project = cc.get_id() == 'msvc'

install_sizes = [16, 22, 24, 32, 48, 64, 128, 256, 512]

distcheck_configure_flags = '--disable-icon-mapping'
add_global_arguments(distcheck_configure_flags, language : 'c')


srcdir = meson.source_root()

subdirs = ['src', 'win32']

aclocal_flags = ['-I', 'm4']
add_global_arguments(aclocal_flags, language: 'c')

cursor_dir = get_option('datadir') / 'icons' / 'Adwaita' / 'cursors'

if host_machine.system() == 'windows'
  cur_files = [
    'all-scroll.cur',
    'bd_double_arrow.cur',
    'bottom_left_corner.cur',
    'bottom_right_corner.cur',
    'bottom_side.cur',
    'bottom_tee.cur',
    'cell.cur',
    'circle.cur',
    'context-menu.cur',
    'copy.cur',
    'cross.cur',
    'crossed_circle.cur',
    'dnd-ask.cur',
    'dnd-copy.cur',
    'dnd-link.cur',
    'dnd-move.cur',
    'dnd-no-drop.cur',
    'dnd-none.cur',
    'dotbox.cur',
    'fd_double_arrow.cur',
    'grabbing.cur',
    'hand1.cur',
    'hand2.cur',
    'left_ptr.cur',
    'left_side.cur',
    'left_tee.cur',
    'link.cur',
    'll_angle.cur',
    'lr_angle.cur',
    'move.cur',
    'pencil.cur',
    'plus.cur',
    'pointer-move.cur',
    'question_arrow.cur',
    'right_ptr.cur',
    'right_side.cur',
    'right_tee.cur',
    'sb_down_arrow.cur',
    'sb_h_double_arrow.cur',
    'sb_left_arrow.cur',
    'sb_right_arrow.cur',
    'sb_up_arrow.cur',
    'sb_v_double_arrow.cur',
    'tcross.cur',
    'top_left_corner.cur',
    'top_right_corner.cur',
    'top_side.cur',
    'top_tee.cur',
    'ul_angle.cur',
    'ur_angle.cur',
    'vertical-text.cur',
    'X_cursor.cur',
    'xterm.cur',
    'zoom-in.cur',
    'zoom-out.cur',
    'left_ptr_watch.ani',
    'watch.ani'
  ]

else
  cur_files = [
    'all-scroll',
    'bd_double_arrow',
    'bottom_left_corner',
    'bottom_right_corner',
    'bottom_side',
    'bottom_tee',
    'cell',
    'circle',
    'context-menu',
    'cross',
    'crossed_circle',
    'dnd-ask',
    'dnd-copy',
    'dnd-link',
    'dnd-move',
    'dnd-no-drop',
    'dnd-none',
    'dotbox',
    'fd_double_arrow',
    'grabbing',
    'hand1',
    'hand2',
    'left_ptr',
    'left_ptr_watch',
    'left_side',
    'left_tee',
    'link',
    'll_angle',
    'lr_angle',
    'move',
    'pencil',
    'plus',
    'pointer-move',
    'question_arrow',
    'right_ptr',
    'right_side',
    'right_tee',
    'sb_down_arrow',
    'sb_h_double_arrow',
    'sb_left_arrow',
    'sb_right_arrow',
    'sb_up_arrow',
    'sb_v_double_arrow',
    'tcross',
    'top_left_corner',
    'top_right_corner',
    'top_side',
    'top_tee',
    'ul_angle',
    'ur_angle',
    'vertical-text',
    'watch',
    'X_cursor',
    'xterm',
    'zoom-in',
    'zoom-out',
  ]
endif

cursor_data = []
foreach f: cur_files
  path = files(srcdir / 'Adwaita' / 'cursors' / f)
  cursor_data += [path]
endforeach

# if get_option('enable-l-xl-variants')
#   cursorl_dir = get_option('datadir') / 'icons' / 'Adwaita-Large' / 'cursors'
#     foreach f: cur_files
#       path = files(srcdir / 'Adwaita-Large' / 'cursors' / f)
#       cursorl_data += [path]
#     endforeach
#   cursorxl_dir = get_option('datadir') / 'icons' / 'Adwaita-ExtraLarge' / 'cursors'
#     foreach f: cur_files
#       path = files(srcdir / 'Adwaita-ExtraLarge' / 'cursors' / f)
#       cursorxl_data += [path]
#     endforeach
# else
  cursorl_dir = ''
  cursorl_data = []
  cursorxl_dir = ''
  cursorxl_data = []
# endif

theme_in_files = ['index.theme.in']
theme_data = []
foreach f : theme_in_files
  theme_data += [f.replace('.theme.in', '.theme')]
endforeach

theme_dirs = []
foreach size: install_sizes
  found_dirs = []
  files_list = files(srcdir / 'SVGOUTDIR' / size / '*')
  foreach dir: files_list
    if is_dir(dir)
      found_dirs += dir
    endif
  endforeach
  foreach dir: found_dirs
    theme_dirs += dir.relative_path(srcdir)
  endforeach
endforeach

theme_dirs += [
  'scalable/actions',
  'scalable/apps',
  'scalable/categories',
  'scalable/devices',
  'scalable/emblems',
  'scalable/emotes',
  'scalable/mimetypes',
  'scalable/places',
  'scalable/status',
  'scalable/legacy',
  'scalable/ui',
  'symbolic-up-to-32/status',
  'symbolic/actions',
  'symbolic/apps',
  'symbolic/categories',
  'symbolic/devices',
  'symbolic/emblems',
  'symbolic/emotes',
  'symbolic/mimetypes',
  'symbolic/places',
  'symbolic/status',
  'symbolic/legacy',
  'symbolic/ui',
]

template = configure_file(
  input: srcdir / theme_in_files[0],
  output: meson.current_build_dir() / theme_data[0],
  install: true,
  install_dir: get_option('datadir') / 'icons' / 'Adwaita' / 'index.theme',
  configuration: [
    'THEME_DIRS= {}'.format(';'.join(theme_dirs))
  ],
)

install_data(template, install_dir: get_option('datadir') / 'icons' / 'Adwaita' / 'index.theme')

install_data(cursor_data, install_dir: cursor_dir)
install_data(cursorl_data, install_dir: cursorl_dir)
install_data(cursorlx_data, install_dir: cursorlx_dir)
