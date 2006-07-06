NULL=

iconsize=24x24
category=emblems
icondir = $(datadir)/icons/gnome/$(iconsize)/$(category)

icon_DATA =\
	emblem-favorite.png	\
	emblem-important.png	\
	emblem-symbolic-link.png \
	$(NULL)

EXTRA_DIST = $(icon_DATA)

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))
