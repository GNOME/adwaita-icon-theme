NULL=

size = 32x32
context = emblems
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =\
	emblem-important.png \
	emblem-favorite.png	\
	emblem-symbolic-link.png	\
	$(NULL)

EXTRA_DIST = $(icons_DATA)

MAINTAINERCLEANFILES =			\
	Makefile.in


install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))
