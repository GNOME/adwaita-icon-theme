
size = 16x16
context = categories

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	applications-development.png	\
	applications-games.png	\
	applications-graphics.png	\
	applications-internet.png	\
	preferences-desktop.png	\
	preferences-system.png	

EXTRA_DIST =				\
	$(icons_DATA)

MAINTAINERCLEANFILES =			\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))
