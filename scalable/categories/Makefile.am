
size = scalable
context = categories
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	applications-accessories.svg	\
	applications-games.svg	\
	applications-internet.svg	\
	preferences-system.svg

EXTRA_DIST =		\
	$(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

