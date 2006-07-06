
size = 32x32
context = status

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	dialog-error.png	\
	dialog-information.png	\
	dialog-warning.png	\
	folder-drag-accept.png	\
	folder-open.png	\
	folder-visiting.png	\
	image-loading.png	\
	user-trash-full.png

EXTRA_DIST =				\
	$(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

