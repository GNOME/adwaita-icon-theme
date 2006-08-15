
size = 32x32
context = categories

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	applications-accessories.png	\
	applications-development.png	\
	applications-games.png	\
	applications-internet.png	\
	preferences-system.png

EXTRA_DIST =				\
	$(icons_DATA)

MAINTAINERCLEANFILES =			\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))
