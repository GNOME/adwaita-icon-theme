
size = 22x22
context = apps
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	accessories-dictionary.png	\
	accessories-text-editor.png	\
	applets-screenshooter.png	\
	boot.png			\
	evolution.png			\
	gnome-shutdown.png		\
	gnome-session.png		\
	help-browser.png		\
	im-aim.png			\
	im-icq.png			\
	im-jabber.png			\
	im-msn.png			\
	im-nov.png			\
	im-yahoo.png			\
	logviewer.png			\
	multimedia-volume-control.png		\
	preferences-desktop-accessibility.png	\
	preferences-desktop-keyboard-shortcuts.png	\
	preferences-desktop-remote-desktop.png	\
	preferences-desktop-screensaver.png	\
	preferences-desktop-theme.png	\
	preferences-desktop-wallpaper.png	\
	preferences-system-windows.png	\
	system-file-manager.png		\
	utilities-system-monitor.png	\
	utilities-terminal.png		\
	web-browser.png

EXTRA_DIST =		\
	$(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

