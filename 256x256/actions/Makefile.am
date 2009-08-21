
size = 256x256
context = actions

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	address-book-new.png		\
	document-page-setup.png		\
	document-revert.png		\
	folder-new.png			\
	document-new.png		\
	document-print.png		\
	edit-delete.png			\
	document-open.png		\
	document-properties.png		\
	edit-select-all.png		\
	system-lock-screen.png

EXTRA_DIST =				\
	$(icons_DATA)

MAINTAINERCLEANFILES =			\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

check:
	if test -r CVS/Entries; then \
		for icon in *.png; do \
			if grep $$icon CVS/Entries > /dev/null; then \
				if ! grep $$icon Makefile > /dev/null; then \
					echo "Missing $$icon in Makefile.am"; \
					exit 1; \
				fi; \
			fi; \
		done; \
	else \
		for icon in *.png; do \
			if ! grep $$icon Makefile > /dev/null; then \
				echo "Missing $$icon in Makefile.am"; \
				exit 1; \
			fi; \
		done; \
	fi

-include $(top_srcdir)/git.mk
