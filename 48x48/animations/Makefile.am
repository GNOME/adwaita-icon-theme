
size = 48x48
context = animations

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =			\
	process-idle.png	\
	process-working.png

EXTRA_DIST =		\
	$(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

