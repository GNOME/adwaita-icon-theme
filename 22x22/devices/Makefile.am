
size = 22x22
context = devices

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	audio-input-microphone.png	\
	battery.png			\
	computer.png			\
	drive-harddisk.png		\
	drive-optical.png		\
	drive-removable-media.png	\
	input-keyboard.png		\
	input-mouse.png			\
	media-flash.png			\
	media-floppy.png		\
	media-optical.png		\
	modem.png		\
	multimedia-player.png		\
	network-wired.png		\
	network-wireless.png		\
	printer.png			\
	video-display.png

EXTRA_DIST =		\
	$(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))
