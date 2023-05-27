if host_machine.system() != 'windows'
  command_output = run_command('../tools/find_cursors.py', check: true)
  cursors = command_output.stdout().strip().split('\n')
  install_data(cursors, install_dir: get_option('datadir') / 'icons' / 'Adwaita', preserve_path: true)
else
  command_output = run_command('../tools/find_cursors_win32.py', check: true)
  cursors = command_output.stdout().strip().split('\n')
  install_data(cursors, install_dir: get_option('datadir') / 'icons' / 'Adwaita', preserve_path: true)
endif
