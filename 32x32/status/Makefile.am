
size = 32x32
context = status

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	dialog-error.png	\
	dialog-warning.png

EXTRA_DIST =				\
	$(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

