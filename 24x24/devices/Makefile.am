
size = 24x24
context = devices

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	audio-input-microphone.png	\
	battery.png			\
	computer.png			\
	drive-cdrom.png			\
	drive-harddisk.png		\
	drive-removable-media.png	\
	input-mouse.png			\
	media-cdrom.png			\
	media-floppy.png		\
	modem.png			\
	multimedia-player.png		\
	network-wired.png		\
	network-wireless.png		\
	printer.png

EXTRA_DIST =		\
	$(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))
