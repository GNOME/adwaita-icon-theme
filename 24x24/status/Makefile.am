
size = 24x24
context = status

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	appointment-missed.png		\
	appointment-soon.png		\
	audio-volume-high.png		\
	audio-volume-low.png		\
	audio-volume-medium.png		\
	audio-volume-muted.png		\
	dialog-error.png		\
	dialog-information.png		\
	dialog-warning.png		\
	folder-drag-accept.png		\
	folder-drag-accept.icon		\
	folder-open.png			\
	folder-visiting.png		\
	folder-visiting.icon		\
	media-playlist-repeat.png	\
	media-playlist-shuffle.png	\
	network-wireless-encrypted.png	\
	user-trash-full.png

EXTRA_DIST =				\
	$(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

