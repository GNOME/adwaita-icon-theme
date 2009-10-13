themedir = $(datadir)/icons/gnome/24x24/apps
theme_DATA =   accessories-calculator.png accessories-text-editor.png applets-screenshooter.png preferences-desktop-accessibility.png preferences-desktop-keyboard.png preferences-desktop-screensaver.png system-software-install.png system-users.png user-info.png utilities-terminal.png
EXTRA_DIST = $(theme_DATA)
install-data-local: install-themeDATA
	(cd "$(DESTDIR)$(themedir)" && $(ICONMAP) -c apps )
MAINTAINERCLEANFILES = Makefile.in
