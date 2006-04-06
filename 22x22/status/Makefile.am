
size = 22x22
context = status

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	folder-drag-accept.png		\
	folder-open.png			\
	folder-visiting.png		\
	media-playlist-repeat.png	\
	media-playlist-shuffle.png	\
	user-trash-full.png		\
	weather-clear.png		\
	weather-clear-night.png

EXTRA_DIST =				\
	$(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

