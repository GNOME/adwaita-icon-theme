
size = scalable
context = apps
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	accessories-dictionary.svg	\
	accessories-text-editor.svg	\
	evolution.svg			\
	gnome-shutdown.svg		\
	help-browser.svg		\
	im-aim.svg			\
	im-icq.svg			\
	im-jabber.svg			\
	im-msn.svg			\
	im-nov.svg			\
	im-yahoo.svg			\
	logviewer.svg			\
	multimedia-volume-control.svg	\
	preferences-desktop-font.svg	\
	preferences-desktop-keyboard-shortcuts.svg	\
	preferences-desktop-remote-desktop.svg	\
	preferences-desktop-screensaver.svg	\
	preferences-desktop-theme.svg	\
	preferences-desktop-wallpaper.svg	\
	preferences-system-windows.svg	\
	system-file-manager.svg		\
	utilities-system-monitor.svg	\
	utilities-terminal.svg		\
	web-browser.svg

EXTRA_DIST =		\
	$(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

