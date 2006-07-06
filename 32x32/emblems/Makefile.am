NULL=

iconsize=32x32
category=emblems
icondir = $(datadir)/icons/gnome/$(iconsize)/$(category)

icon_DATA =\
	emblem-important.png \
	emblem-favorite.png	\
	emblem-symbolic-link.png	\
	$(NULL)

EXTRA_DIST = $(icon_DATA)

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))
