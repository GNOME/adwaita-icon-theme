
size = scalable
context = actions
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	address-book-new.svg		\
	application-exit.svg		\
	appointment-new.svg		\
	bookmark-new.svg		\
	contact-new.svg			\
	edit-clear.svg			\
	edit-copy.svg			\
	edit-find.svg			\
	edit-find-replace.svg		\
	edit-paste.svg		\
	edit-redo.svg			\
	edit-undo.svg			\
	document-new.svg		\
	document-open.svg		\
	document-open-recent.svg	\
	document-page-setup.svg		\
	document-print.svg		\
	document-print-preview.svg	\
	document-properties.svg		\
	document-revert.svg		\
	document-save.svg		\
	document-save-as.svg		\
	document-send.svg		\
	folder-new.svg			\
	edit-cut.svg			\
	edit-delete.svg			\
	edit-select-all.svg		\
	go-bottom.svg			\
	go-down.svg			\
	go-first.svg			\
	go-home.svg			\
	go-jump.svg			\
	go-last.svg			\
	go-next.svg			\
	go-previous.svg			\
	go-top.svg			\
	go-up.svg			\
	format-indent-less.svg		\
	format-indent-more.svg		\
	format-justify-center.svg	\
	format-justify-fill.svg		\
	format-justify-left.svg		\
	format-justify-right.svg	\
	format-text-bold.svg		\
	format-text-direction-ltr.svg	\
	format-text-direction-rtl.svg	\
	format-text-italic.svg		\
	format-text-strikethrough.svg	\
	format-text-underline.svg	\
	help-about.svg	\
	help-contents.svg		\
	help-faq.svg			\
	insert-image.svg		\
	insert-link.svg			\
	insert-object.svg		\
	insert-text.svg			\
	list-add.svg			\
	list-remove.svg			\
	mail-forward.svg	\
	mail-mark-important.svg		\
	mail-mark-read.svg		\
	mail-mark-unread.svg		\
	mail-message-new.svg		\
	mail-reply-all.svg		\
	mail-reply-sender.svg		\
	mail-send.svg			\
	mail-send-receive.svg		\
	media-eject.svg			\
	media-playback-pause.svg \
	media-playback-start.svg \
	media-playback-stop.svg \
	media-record.svg \
	media-seek-backward.svg \
	media-seek-forward.svg \
	media-skip-backward.svg \
	media-skip-forward.svg \
	object-flip-horizontal.svg	\
	object-flip-vertical.svg	\
	object-rotate-left.svg		\
	object-rotate-right.svg		\
	process-stop.svg		\
	system-lock-screen.svg		\
	system-log-out.svg		\
	system-run.svg			\
	system-search.svg		\
	tools-check-spelling.svg	\
	view-fullscreen.svg		\
	view-refresh.svg		\
	view-restore.svg		\
	view-sort-ascending.svg		\
	view-sort-descending.svg	\
	window-close.svg			\
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
