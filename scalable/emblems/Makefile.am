NULL=

iconsize=scalable
category=emblems
icondir = $(datadir)/icons/gnome/$(iconsize)/$(category)

icon_in_files =\
	emblem-distinguished.icon.in	\
	emblem-draft.icon.in		\
	emblem-new.icon.in		\
	emblem-personal.icon.in		\
	emblem-urgent.icon.in		\
	$(NULL)

icon_DATA =\
	emblem-distinguished.svg	\
	emblem-draft.svg		\
	emblem-new.svg			\
	emblem-personal.svg		\
	emblem-urgent.svg		\
	$(icon_in_files:.icon.in=.icon)
	$(NULL)

%.icon:   %.icon.in   $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; $(INTLTOOL_MERGE) $(top_srcdir)/po $< $@ -d -u -c $(top_builddir)/po/.intltool-merge-cache

EXTRA_DIST = $(icon_DATA)
