NULL=

size = scalable
context = emblems
iconsdir = $(themedir)/$(size)/$(context)
svgdir = $(iconsdir)

icon_in_files =				\
	emblem-documents.icon.in	\
	emblem-downloads.icon.in	\
	emblem-favorite.icon.in		\
	emblem-generic.icon.in		\
	emblem-important.icon.in	\
	emblem-mail.icon.in		\
	emblem-new.icon.in		\
	emblem-package.icon.in		\
	emblem-photos.icon.in		\
	emblem-readonly.icon.in		\
	emblem-unreadable.icon.in	\
	emblem-urgent.icon.in		\
	emblem-web.icon.in		\
	$(NULL)

icons_DATA =				\
	$(icon_in_files:.icon.in=.icon)

svg_DATA =				\
	emblem-default.svg		\
	emblem-documents.svg		\
	emblem-downloads.svg		\
	emblem-favorite.svg		\
	emblem-generic.svg		\
	emblem-important.svg		\
	emblem-mail.svg			\
	emblem-new.svg			\
	emblem-package.svg		\
	emblem-photos.svg		\
	emblem-readonly.svg		\
	emblem-shared.svg		\
	emblem-symbolic-link.svg	\
	emblem-system.svg		\
	emblem-unreadable.svg		\
	emblem-urgent.svg		\
	emblem-web.svg			\
	$(NULL)

%.icon:   %.icon.in   $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; $(INTLTOOL_MERGE) $(top_srcdir)/po $< $@ -d -u -c $(top_builddir)/po/.intltool-merge-cache

EXTRA_DIST = $(icon_in_files) $(svg_DATA)

CLEANFILES = $(icons_DATA)

install-data-local: install-iconsDATA install-svgDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

check:
	if test -r CVS/Entries; then \
		for icon in *.svg; do \
			if grep $$icon CVS/Entries > /dev/null; then \
				if ! grep $$icon Makefile > /dev/null; then \
					echo "Missing $$icon in Makefile.am"; \
					exit 1; \
				fi; \
			fi; \
		done; \
	else \
		for icon in *.svg; do \
			if ! grep $$icon Makefile > /dev/null; then \
				echo "Missing $$icon in Makefile.am"; \
				exit 1; \
			fi; \
		done; \
	fi
