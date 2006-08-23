NULL=

size = 16x16
context = emblems
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	emblem-favorite.png		\
	emblem-important.png		\
	emblem-package.png		\
	emblem-symbolic-link.png	\
	emblem-web.png			\
	$(NULL)

EXTRA_DIST = $(icons_DATA)

MAINTAINERCLEANFILES =			\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))
