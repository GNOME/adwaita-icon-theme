themedir = $(datadir)/icons/gnome/32x32/apps
theme_DATA =   accessories-calculator.png accessories-character-map.png accessories-dictionary.png accessories-text-editor.png applets-screenshooter.png help-browser.png logviewer.png multimedia-volume-control.png preferences-desktop-accessibility.png preferences-desktop-font.png preferences-desktop-keyboard.png preferences-desktop-keyboard-shortcuts.png preferences-desktop-locale.png preferences-desktop-remote-desktop.png preferences-desktop-screensaver.png preferences-desktop-theme.png preferences-desktop-wallpaper.png preferences-system-windows.png system-file-manager.png system-software-install.png system-software-update.png system-users.png user-info.png utilities-system-monitor.png utilities-terminal.png web-browser.png
EXTRA_DIST = $(theme_DATA)
install-data-local: install-themeDATA
	(cd "$(DESTDIR)$(themedir)" && $(ICONMAP) -c apps )
MAINTAINERCLEANFILES = Makefile.in
