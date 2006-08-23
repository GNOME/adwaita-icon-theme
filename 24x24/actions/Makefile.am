
size = 24x24
context = actions

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	application-exit.png		\
	appointment-new.png		\
	bookmark-new.png		\
	document-new.png		\
	document-print.png		\
	document-print-preview.png	\
	document-save.png		\
	document-save-as.png		\
	edit-copy.png			\
	edit-cut.png			\
	edit-delete.png			\
	edit-find.png			\
	edit-find-replace.png		\
	edit-paste.png			\
	edit-redo.png			\
	edit-undo.png			\
	format-indent-less.png		\
	format-indent-more.png		\
	format-justify-center.png	\
	format-justify-fill.png		\
	format-justify-left.png		\
	format-justify-right.png	\
	format-text-bold.png		\
	format-text-italic.png		\
	format-text-strikethrough.png	\
	format-text-underline.png	\
	go-bottom.png			\
	go-down.png			\
	go-first.png			\
	go-home.png			\
	go-last.png			\
	go-next.png			\
	go-previous.png			\
	go-top.png			\
	go-up.png			\
	list-add.png			\
	list-remove.png			\
	mail-forward.png		\
	mail-mark-junk.png		\
	mail-mark-not-junk.png		\
	mail-message-new.png		\
	mail-reply-all.png		\
	mail-reply-sender.png		\
	mail-send-receive.png		\
	media-playback-pause.png	\
	media-playback-start.png	\
	media-playback-stop.png		\
	media-record.png		\
	media-seek-backward.png		\
	media-seek-forward.png		\
	media-skip-backward.png		\
	media-skip-forward.png		\
	process-stop.png		\
	system-run.png			\
	system-lock-screen.png		\
	tab-new.png			\
	view-fullscreen.png		\
	view-refresh.png 		\
	view-restore.png		\
	window-close.png		\
	window-new.png			\
	zoom-best-fit.png		\
	zoom-in.png			\
	zoom-original.png		\
	zoom-out.png

EXTRA_DIST =				\
	$(icons_DATA)

MAINTAINERCLEANFILES =			\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

