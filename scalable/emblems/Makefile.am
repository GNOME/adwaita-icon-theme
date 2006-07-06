NULL=

size = scalable
context = emblems
iconsdir = $(themedir)/$(size)/$(context)
svgdir = $(icondir)

icon_in_files =\
	emblem-favorite.icon.in \
	emblem-generic.icon.in \
	emblem-important.icon.in \
	emblem-mail.icon.in \
	emblem-special.icon.in \
	emblem-urgent.icon.in \
	$(NULL)

icons_DATA =\
	$(icon_in_files:.icon.in=.icon)
	$(NULL)

svg_DATA =				\
	emblem-favorite.svg		\
	emblem-generic.svg		\
	emblem-important.svg		\
	emblem-mail.svg			\
	emblem-special.svg		\
	emblem-symbolic-link.svg	\
	emblem-urgent.svg		\
	$(NULL)

%.icon:   %.icon.in   $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; $(INTLTOOL_MERGE) $(top_srcdir)/po $< $@ -d -u -c $(top_builddir)/po/.intltool-merge-cache

EXTRA_DIST = $(icon_in_files) $(svg_DATA)

CLEANFILES = $(icons_DATA)

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))
