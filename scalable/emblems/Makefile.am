NULL=

iconsize=scalable
category=emblems
icondir = $(datadir)/icons/gnome/$(iconsize)/$(category)

icon_in_files =\
	$(NULL)

icon_DATA =\
	$(icon_in_files:.icon.in=.icon)
	$(NULL)

%.icon:   %.icon.in   $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; $(INTLTOOL_MERGE) $(top_srcdir)/po $< $@ -d -u -c $(top_builddir)/po/.intltool-merge-cache

EXTRA_DIST = $(icon_DATA)
