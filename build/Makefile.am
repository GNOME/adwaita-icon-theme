themedir = $(datadir)/icons/THEME_NAME

SUBDIRS = REAL_SUB_DIRS

#THEME_IN_FILES = index.theme.in

#%.theme:   %.theme.in $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; $(INTLTOOL_MERGE) $(top_srcdir)/po $< $@ -d -u -c $(top_builddir)/po/.intltool-merge-cache

theme_DATA = index.theme

gtk_update_icon_cache = gtk-update-icon-cache -f -t "$(themedir)"

install-data-hook:
		@if test -z "$(DESTDIR)"; then \
                        echo "Updating Gtk icon cache."; \
                        $(gtk_update_icon_cache); \
                else \
                        echo "*** Icon cache not updated.       After install, run this:"; \
                        echo "***        $(gtk_update_icon_cache)"; \
                fi


EXTRA_DIST=                             \
        index.theme

# Extra clean files so that maintainer-clean removes *everything*
MAINTAINERCLEANFILES = aclocal.m4 compile config.guess config.sub \
                       configure depcomp install-sh ltmain.sh     \
                       Makefile.in missing config.h.in

