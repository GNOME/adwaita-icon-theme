
size = scalable
context = actions
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	edit-find.svg			\
	edit-find-replace.svg		\
	document-new.svg		\
	document-print.svg		\
	document-print-preview.svg	\
	document-save.svg		\
	document-save-as.svg		\
	folder-new.svg			\
	edit-delete.svg			\
	go-home.svg			\
	list-add.svg			\
	list-remove.svg			\
	system-run.svg			\
	view-fullscreen.svg		\
	view-restore.svg		\
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

