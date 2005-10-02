SUBDIRS = 12x12 16x16 24x24 32x32 36x36 48x48 72x72 96x96 192x192 scalable po

pkgconfigdir = $(datadir)/pkgconfig
pkgconfig_DATA = gnome-icon-theme.pc

THEME_IN_FILES=index.theme.in

%.theme:   %.theme.in $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; $(INTLTOOL_MERGE) $(top_srcdir)/po $< $@ -d -u -c $(top_builddir)/po/.intltool-merge-cache

hicolor_dirs = \
	$(datadir)/pixmaps		\
	$(datadir)/icons		\
	/usr/share/icons		\
	/usr/share/pixmaps
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
# Ensure that hicolor is installed too
install-data-local:
	$(MAKE) -C po uninstall
if ENABLE_HICOLOR_CHECK
	@dirs='$(hicolor_dirs)'; for dir in $$dirs; do		\
	    echo Checking for hicolor theme in \'$$dir/hicolor/index.theme\' ;	\
	    if test -f "$$dir/hicolor/index.theme"; then	\
		echo Good.  Found it.	;			\
		exit 0;						\
	    fi ;						\
	done ;							\
	echo ;							\
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" ;	\
	echo "Could not find the theme 'hicolor' which acts as the base for all other" ;	\
	echo "themes, including gnome-icon-theme.  Perhaps you need to install it." ;		\
	echo "You can get a copy from http://freedesktop.org/Software/icon-theme/releases" ;	\
	echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" ;	\
	echo ;											\
	exit 1
endif

DISTCHECK_CONFIGURE_FLAGS = --disable-hicolor-check

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

