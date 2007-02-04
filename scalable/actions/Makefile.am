
size = scalable
context = actions
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	address-book-new.svg		\
	bookmark-new.svg		\
	contact-new.svg			\
	edit-find.svg			\
	edit-find-replace.svg		\
	edit-redo.svg			\
	edit-undo.svg			\
	document-new.svg		\
	document-open.svg		\
	document-print.svg		\
	document-print-preview.svg	\
	document-properties.svg		\
	document-save.svg		\
	document-save-as.svg		\
	folder-new.svg			\
	edit-cut.svg			\
	edit-delete.svg			\
	edit-select-all.svg		\
	go-bottom.svg			\
	go-down.svg			\
	go-first.svg			\
	go-home.svg			\
	go-last.svg			\
	go-next.svg			\
	go-previous.svg			\
	go-top.svg			\
	go-up.svg			\
	format-justify-center.svg	\
	format-justify-fill.svg		\
	format-justify-left.svg		\
	format-justify-right.svg	\
	help-faq.svg			\
	insert-image.svg		\
	insert-link.svg			\
	insert-text.svg			\
	list-add.svg			\
	list-remove.svg			\
	media-eject.svg			\
	object-flip-horizontal.svg	\
	object-flip-vertical.svg	\
	object-rotate-left.svg		\
	object-rotate-right.svg		\
	process-stop.svg		\
	system-lock-screen.svg		\
	system-run.svg			\
	view-fullscreen.svg		\
	view-restore.svg		\
	view-sort-ascending.svg		\
	view-sort-descending.svg	\
	window-new.svg			\
	zoom-best-fit.svg		\
	zoom-in.svg			\
	zoom-original.svg		\
	zoom-out.svg	

EXTRA_DIST =		\
	$(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
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
