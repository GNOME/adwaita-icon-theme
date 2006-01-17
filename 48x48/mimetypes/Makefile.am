
size = 48x48
context = mimetypes

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	application-x-executable.png	\
	audio-x-generic.png		\
	image-x-generic.png		\
	package-x-generic.png		\
	text-html.png			\
	text-x-generic.png		\
	video-x-generic.png		\
	x-office-document.png		\
	x-office-presentation.png	\
	x-office-spreadsheet.png

EXTRA_DIST =				\
	$(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))
