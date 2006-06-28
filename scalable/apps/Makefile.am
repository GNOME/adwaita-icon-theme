
size = scalable
context = apps
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	accessories-dictionary.svg	\
	evolution.svg			\
	gnome-shutdown.svg		\
	im-aim.svg			\
	im-icq.svg			\
	im-jabber.svg			\
	im-msn.svg			\
	im-nov.svg			\
	im-yahoo.svg			\
	multimedia-volume-control.svg	\
	preferences-desktop-wallpaper.svg	\
	web-browser.svg

EXTRA_DIST =		\
	$(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

