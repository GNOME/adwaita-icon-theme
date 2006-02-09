size = 16x16
context = apps

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	accessories-text-editor.png	\
	evolution.png			\
	gnome-logout.png		\
	gnome-run.png			\
	gnome-shutdown.png	\
	gnome-window-manager.png	\
	help-browser.png		\
	image-viewer.png		\
	multimedia-volume-control.png	\
	panel-notification-area.png	\
	panel-window-list.png		\
	panel-window-menu.png		\
	preferences-desktop-locale.png

EXTRA_DIST = $(icons_DATA)

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

