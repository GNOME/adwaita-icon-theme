
size = 22x22
context = status

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	appointment-missed.png	\
	appointment-soon.png	\
	dialog-error.png	\
	folder-drag-accept.png		\
	folder-open.png			\
	folder-visiting.png		\
	image-loading.png		\
	media-playlist-repeat.png	\
	media-playlist-shuffle.png	\
	network-wireless-encrypted.png	\
	user-trash-full.png		\
	weather-clear.png		\
	weather-clear-night.png

EXTRA_DIST =				\
	$(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

