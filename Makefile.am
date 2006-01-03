SUBDIRS = 12x12 16x16 24x24 32x32 36x36 48x48 72x72 96x96 192x192 scalable po

pkgconfigdir = $(datadir)/pkgconfig
pkgconfig_DATA = gnome-icon-theme.pc

THEME_IN_FILES=index.theme.in

%.theme:   %.theme.in $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; $(INTLTOOL_MERGE) $(top_srcdir)/po $< $@ -d -u -c $(top_builddir)/po/.intltool-merge-cache

icondir = $(datadir)/icons/gnome

icon_DATA = index.theme

EXTRA_DIST=				\
	index.theme.in 			\
	intltool-update.in 		\
	intltool-merge.in 		\
	intltool-extract.in		\
	gnome-icon-theme.pc.in		\
	mkinstalldirs

# we don't want to install mo files, all translations are already stored
# in theme files
install-data-local:
	$(MAKE) -C po uninstall

CLEANFILES = 				\
	index.theme

DISTCLEANFILES = 			\
	intltool-extract		\
	intltool-merge			\
	intltool-update

MAINTAINERCLEANFILES =			\
	Makefile.in			\
	aclocal.m4			\
	configure			\
	install-sh			\
	intltool-extract.in		\
	intltool-merge.in		\
	intltool-update.in		\
	missing				\
	mkinstalldirs

