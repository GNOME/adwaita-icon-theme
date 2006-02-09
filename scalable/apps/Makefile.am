
size = scalable
context = apps
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	evolution.svg			\
	gnome-shutdown.svg	\
	multimedia-volume-control.svg

EXTRA_DIST =		\
	$(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

