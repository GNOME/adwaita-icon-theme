
size = 48x48
context = actions

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	address-book-new.png		\
	application-exit.png		\
	bookmark-new.png		\
	call-start.png			\
	call-stop.png			\
	contact-new.png			\
	document-new.png		\
	document-open.png		\
	document-page-setup.png		\
	document-print.png		\
	document-properties.png		\
	document-revert.png		\
	document-save-as.png		\
	document-save.png		\
	edit-delete.png			\
	edit-find.png			\
	edit-find-replace.png		\
	edit-select-all.png		\
	folder-new.png			\
	format-text-direction-ltr.png	\
	format-text-direction-rtl.png	\
	mail-mark-junk.png		\
	mail-mark-not-junk.png		\
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
