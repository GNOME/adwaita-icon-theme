
size = 22x22
context = apps
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	accessories-dictionary.png	\
	applets-screenshooter.png	\
	boot.png			\
	gnome-shutdown.png		\
	gnome-session.png		\
	im-aim.png			\
	im-icq.png			\
	im-jabber.png			\
	im-msn.png			\
	im-nov.png			\
	im-yahoo.png			\
	preferences-desktop-accessibility.png	\
	preferences-desktop-wallpaper.png	\
	utilities-system-monitor.png	\
	web-browser.png

EXTRA_DIST =		\
	$(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

