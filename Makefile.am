SUBDIRS = 8x8 16x16 22x22 24x24 32x32 48x48 256x256 scalable po

pkgconfigdir = $(datadir)/pkgconfig
pkgconfig_DATA = gnome-icon-theme.pc

THEME_IN_FILES = index.theme.in

%.theme:   %.theme.in $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; $(INTLTOOL_MERGE) $(top_srcdir)/po $< $@ -d -u -c $(top_builddir)/po/.intltool-merge-cache

theme_DATA = index.theme

EXTRA_DIST=				\
	index.theme.in 			\
	gnome-icon-theme.pc.in		\
	mkinstalldirs

# we don't want to install mo files, all translations are already stored
# in theme files
install-data-local:
	$(MAKE) -C po uninstall

CLEANFILES = 				\
	index.theme

MAINTAINERCLEANFILES =			\
	INSTALL				\
	Makefile.in			\
	aclocal.m4			\
	configure			\
	install-sh			\
	missing				\
	mkinstalldirs


-include $(top_srcdir)/git.mk
