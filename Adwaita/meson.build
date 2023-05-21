command_output = run_command('../tools/find_svg_png_files.py', check: true)
svg_png_files = command_output.stdout().strip().split('\n')
install_data(svg_png_files, install_dir: get_option('datadir') / 'icons', preserve_path: true)

if host_machine.system() == 'windows'
  command_output = run_command('../tools/find_cursors_win.py', check: true)
else
  command_output = run_command('../tools/find_cursors.py', check: true)
endif
cursors = command_output.stdout().strip().split('\n')
install_data(cursors, install_dir: get_option('datadir') / 'icons', preserve_path: true)

command_output = run_command('../tools/find_symlinks.py', check: true)
symlinks = command_output.stdout().strip().split('\n')
foreach symlink : symlinks
    name_dir_pointing = symlink.split()
    install_symlink(
      name_dir_pointing[0],
      install_dir: get_option('datadir') / 'icons' / name_dir_pointing[1],
      pointing_to: name_dir_pointing[2],
   )
endforeach
