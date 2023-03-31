project('adwaita-icon-theme', 'c', version : '44.0')
cc = meson.get_compiler('c')

themedir = get_option('prefix') / 'share' / 'icons' / 'Adwaita'
SVGOUTDIR = 'Adwaita'
SVGSRCDIR = 'src/symbolic'
render_sizes = ['16x16', 'scalable']
symbolic_render_sizes = []
install_sizes = ['16x16', 'scalable']
symbolic_encode_sizes = ['16x16', '32x32']

allow_rendering = false
gtk_update_icon_cache = find_program('gtk-update-icon-cache')
git = find_program('git', required : false)
icontool_render = find_program('icontool-render', required : false)
inkscape = find_program('inkscape', required : false)
if git.found() and icontool_render.found() and inkscape.found()
  allow_rendering = true
endif

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

render_opts = ['-G', '-r', '@BASEDIR@/' + SVGOUTDIR, '-i', '@BASEDIR@/' + SVGSRCDIR, '-s', ','.join(render_sizes)]
if symbolic_render_sizes.length() > 0
  render_opts += ['-S', symbolic_render_sizes.join(',')]
endif
if allow_rendering
  adwaita_cmd = [find_program('python3'), 'render.py'] + render_opts
  configure_file(
    input : 'render.py.in',
    output : 'render.py',
    configuration : adwaita_cmd,
    executable : true,
    install : true,
  )
endif


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

files_to_copy = []
foreach f: files(srcdir / 'Adwaita' / 'cursors' / '*')
  if f.endswith('.cur') or f.endswith('.ani')
    files_to_copy += [f]
  endif
endforeach

win_cursors = files(files_to_copy)
if host_machine.system() == 'windows'
  cursor_data = win_cursors
else
  cursor_data = []
  foreach f: files(srcdir / 'Adwaita' / 'cursors' / '*')
    if f not in win_cursors
      cursor_data += f
    endif
  endforeach
endif

if get_option('enable-l-xl-variants')
  cursorl_dir = get_option('datadir') / 'icons' / 'Adwaita-Large' / 'cursors'
  cursorl_data = files(srcdir / 'Adwaita-Large' / 'cursors' / '*')
  cursorxl_dir = get_option('datadir') / 'icons' / 'Adwaita-ExtraLarge'  'cursors')
  cursorxl_data = files(srcdir / 'Adwaita-ExtraLarge' / 'cursors' / '*')
else
  cursorl_dir = ''
  cursorl_data = []
  cursorxl_dir = ''
  cursorxl_data = []
endif

theme_in_files = ['index.theme.in']
theme_data = []
foreach f : theme_in_files
  theme_data += [f.replace('.theme.in', '.theme')]
endforeach

theme_dirs = []
foreach size: install_sizes
  found_dirs = []
  files_list = files(srcdir / 'SVGOUTDIR' / str(size) / '*')
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
