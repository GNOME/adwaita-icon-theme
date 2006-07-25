
size = 32x32
context = actions

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	document-new.png	\
	system-run.png		\
	view-fullscreen.png

EXTRA_DIST =		\
	$(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

