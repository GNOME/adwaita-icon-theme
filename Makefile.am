SUBDIRS = 12x12 24x24 36x36 48x48 72x72 96x96 192x192 scalable po

THEME_IN_FILES=index.theme.in

%.theme:   %.theme.in $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; $(INTLTOOL_MERGE) $(top_srcdir)/po $< $@ -d -u -c $(top_builddir)/po/.intltool-merge-cache

icondir = $(datadir)/icons/gnome

icon_DATA = index.theme

EXTRA_DIST=index.theme.in index.theme intltool-update.in intltool-merge.in
