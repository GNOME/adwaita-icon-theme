
size = 32x32
context = actions

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =			\
	document-new.png	\
	document-save.png	\
	document-save-as.png	\
	folder-new.png		\
	list-add.png		\
	list-remove.png		\
	system-run.png		\
	view-fullscreen.png	\
	view-restore.png	\
	window-new.png		\
	zoom-best-fit.png	\
	zoom-in.png		\
	zoom-original.png	\
	zoom-out.png

EXTRA_DIST =		\
	$(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

