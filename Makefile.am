DISTCHECK_CONFIGURE_FLAGS = --disable-icon-mapping

SUBDIRS = po $(SVGSRCDIR)

ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}

theme_in_files = index.theme.in.in
theme_DATA = $(theme_in_files:.theme.in.in=.theme)

THEME_DIRS=$(shell SIZES="$(render_sizes)"; for size in $$SIZES; do for dir in `find $(srcdir)/$(SVGOUTDIR)/$$size/* -type d`; do printf "$$dir,"; done; done; echo "scalable/actions,scalable/apps,scalable/devices,scalable/emblems,scalable/mimetypes,scalable/places,scalable/status,scalable/categories")

%.theme.in: %.theme.in.in $(SVGOUTDIR) Makefile
	dirs="`echo $(THEME_DIRS) | sed -e 's#$(srcdir)/gnome/##g'`"; \
	sed -e "s|\@THEME_DIRS\@|$$dirs|g" < $< > $@; \
	for dir in `echo $$dirs | sed -e "s/,/ /g"`; do \
		sizefull="`dirname $$dir`"; \
		if test "$$sizefull" = "scalable"; then \
			size="16"; \
		else \
			size="`echo $$sizefull | sed -e 's/x.*$$//g'`"; \
		fi; \
		context="`basename $$dir`"; \
		echo "[$$dir]" >> $@; \
		if test "$$context" = "actions"; then \
			echo "Context=Actions" >> $@; \
		fi; \
		if test "$$context" = "animations"; then \
			echo "Context=Animations" >> $@; \
		fi; \
		if test "$$context" = "apps"; then \
			echo "Context=Applications" >> $@; \
		fi; \
		if test "$$context" = "categories"; then \
			echo "Context=Categories" >> $@; \
		fi; \
		if test "$$context" = "devices"; then \
			echo "Context=Devices" >> $@; \
		fi; \
		if test "$$context" = "emblems"; then \
			echo "Context=Emblems" >> $@; \
		fi; \
		if test "$$context" = "emotes"; then \
			echo "Context=Emotes" >> $@; \
		fi; \
		if test "$$context" = "intl"; then \
			echo "Context=International" >> $@; \
		fi; \
		if test "$$context" = "mimetypes"; then \
			echo "Context=MimeTypes" >> $@; \
		fi; \
		if test "$$context" = "places"; then \
			echo "Context=Places" >> $@; \
		fi; \
		if test "$$context" = "status"; then \
			echo "Context=Status" >> $@; \
		fi; \
		echo "Size=$$size" >> $@; \
		if test "$$sizefull" = "scalable"; then \
			echo "MinSize=8" >> $@; \
			echo "MaxSize=512" >> $@; \
			echo "Type=Scalable" >> $@; \
		elif test "$$size" = "256"; then \
			echo "MinSize=56" >> $@; \
			echo "MaxSize=512" >> $@; \
			echo "Type=Scalable" >> $@; \
		else \
			echo "Type=Fixed" >> $@; \
		fi; \
		echo "" >> $@; \
	done

@INTLTOOL_THEME_RULE@

# we don't want to install mo files, all translations are already stored
# in theme files
install-data-local:
	$(MAKE) -C po uninstall
	if [ -h $(DESTDIR)$(themedir) ]; then \
		rm -f $(DESTDIR)$(themedir); \
	fi
	if [ -d $(DESTDIR)$(themedir) ]; then \
		touch $(DESTDIR)$(themedir); \
	fi

install-data-hook:
	if test -z "$(DESTDIR)" ; then \
		$(GTK_UPDATE_ICON_CACHE) -q $(DESTDIR)$(themedir); \
	fi

uninstall-hook:
	@rm -f  $(DESTDIR)$(themedir)/icon-theme.cache

pkgconfigdir = $(datadir)/pkgconfig
pkgconfig_DATA = gnome-icon-theme.pc

EXTRA_DIST =			\
	gnome-icon-theme.pc.in  \
	gnome			\
	COPYING_CCBYSA3		\
	COPYING_LGPL		\
	$(theme_in_files)

CLEANFILES = 			\
	$(theme_DATA)

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
	mkinstalldirs			\
	po/Makefile.in.in		\
	po/$(GETTEXT_PACKAGE).pot
