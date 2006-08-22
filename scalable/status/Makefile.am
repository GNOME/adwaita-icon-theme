
size = scalable
context = status

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =			\
	appointment-missed.svg	\
	appointment-soon.svg	\
	audio-volume-high.svg	\
	audio-volume-low.svg	\
	audio-volume-medium.svg	\
	audio-volume-muted.svg	\
	dialog-error.svg	\
	dialog-information.svg	\
	dialog-warning.svg	\
	folder-drag-accept.icon	\
	folder-drag-accept.svg	\
	folder-open.icon	\
	folder-open.svg		\
	folder-visiting.icon	\
	folder-visiting.svg	\
	image-loading.svg	\
	network-error.svg	\
	network-idle.svg	\
	network-offline.svg	\
	network-receive.svg	\
	network-transmit.svg	\
	network-transmit-receive.svg	\
	user-trash-full.svg	\
	weather-clear.svg	\
	weather-clear-night.svg	\
	weather-few-clouds.svg	\
	weather-few-clouds-night.svg	\
	weather-overcast.svg	\
	weather-severe-alert.svg	\
	weather-showers.svg	\
	weather-showers-scattered.svg	\
	weather-snow.svg	\
	weather-storm.svg

EXTRA_DIST =		\
	$(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

