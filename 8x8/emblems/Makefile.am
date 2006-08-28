NULL=

size = 8x8
context = emblems
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	emblem-new.png			\
	emblem-symbolic-link.png	\
	$(NULL)

EXTRA_DIST = $(icons_DATA)

MAINTAINERCLEANFILES =			\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))
