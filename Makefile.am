DISTCHECK_CONFIGURE_FLAGS = --disable-icon-mapping

SUBDIRS = $(SVGSRCDIR)

THEME_DIRS=$(shell SIZES="$(render_sizes)"; for size in $$SIZES; do for dir in `find $(srcdir)/$(SVGOUTDIR)/$$size/* -type d`; do printf "$$dir,"; done; done | sed -e "s/,$$//g")

render: Makefile
	($(am__cd) $(SVGSRCDIR) && $(MAKE) $(AM_MAKEFLAGS) render) \
	|| eval `exit 1`

# we don't want to install mo files, all translations are already stored
# in theme files
install-data-local:
	if [ -h $(DESTDIR)$(themedir) ]; then \
		rm -f $(DESTDIR)$(themedir); \
	fi
	if [ -d $(DESTDIR)$(themedir) ]; then \
		touch $(DESTDIR)$(themedir); \
	fi

install-data-hook:
	$(GTK_UPDATE_ICON_CACHE) -q $(DESTDIR)$(themedir)

EXTRA_DIST = gnome

MAINTAINERCLEANFILES =			\
	Makefile.in			\
	aclocal.m4			\
	config.guess			\
	config.h.in			\
	config.sub			\
	configure			\
	depcomp				\
	install-sh			\
	intltool-*.in			\
	libtool				\
	ltmain.sh			\
	missing				\
	mkinstalldirs

-include $(top_srcdir)/git.mk
