
size = 32x32
context = apps

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	utilities-system-monitor.svg

EXTRA_DIST =		\
	$(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

