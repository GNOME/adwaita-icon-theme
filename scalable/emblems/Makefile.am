NULL=

iconsize=scalable
category=emblems
icondir = $(datadir)/icons/gnome/$(iconsize)/$(category)

icon_in_files =\
	emblem-certified.icon.in \
	emblem-distinguished.icon.in \
	emblem-draft.icon.in \
	emblem-generic.icon.in \
	emblem-important.icon.in \
	emblem-new.icon.in \
	emblem-OK.icon.in \
	emblem-personal.icon.in \
	emblem-special.icon.in \
	emblem-urgent.icon.in \
	$(NULL)

icon_DATA =\
	emblem-certified.svg \
	emblem-distinguished.svg \
	emblem-draft.svg \
	emblem-generic.svg \
	emblem-important.svg \
	emblem-new.svg \
	emblem-noread.svg \
	emblem-nowrite.svg \
	emblem-OK.svg \
	emblem-personal.svg \
	emblem-special.svg \
	emblem-urgent.svg \
	$(icon_in_files:.icon.in=.icon)
	$(NULL)

%.icon:   %.icon.in   $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; $(INTLTOOL_MERGE) $(top_srcdir)/po $< $@ -d -u -c $(top_builddir)/po/.intltool-merge-cache

EXTRA_DIST = $(icon_DATA)
