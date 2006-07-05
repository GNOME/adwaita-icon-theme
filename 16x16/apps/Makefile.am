size = 16x16
context = apps

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	accessibility-directory.png	\
	accessories-dictionary.png	\
	accessories-text-editor.png	\
	applets-screenshooter.png	\
	boot.png	\
	evolution.png			\
	gnome-logout.png		\
	gnome-run.png			\
	gnome-shutdown.png	\
	gnome-session.png	\
	gnome-window-manager.png	\
	help-browser.png		\
	image-viewer.png		\
	im.png	\
	im-aim.png	\
	im-icq.png	\
	im-jabber.png	\
	im-msn.png	\
	im-nov.png	\
	im-yahoo.png	\
	multimedia-volume-control.png	\
	panel-notification-area.png	\
	panel-window-list.png		\
	panel-window-menu.png		\
	preferences-desktop-locale.png	\
	preferences-desktop-wallpaper.png	\
	utilities-system-monitor.png	\
	web-browser.png

EXTRA_DIST = $(icons_DATA)

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

