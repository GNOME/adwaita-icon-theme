
size = 24x24
context = apps
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	gnome-shutdown.png		\
	im-aim.png	\
	im-icq.png	\
	im-jabber.png	\
	im-msn.png	\
	im-nov.png	\
	im-yahoo.png	\
	web-browser.png

EXTRA_DIST =		\
	$(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

