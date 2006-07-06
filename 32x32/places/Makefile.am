
size = 32x32
context = places

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =			\
	folder.png		\
	folder-remote.png		\
	folder-saved-search.png		\
	user-home.svg		\
	user-trash.svg

EXTRA_DIST =		\
	$(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

