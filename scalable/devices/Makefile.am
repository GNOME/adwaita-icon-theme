
size = scalable
context = devices
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =	\
	battery.svg	\
	drive-cdrom.svg	\
	drive-harddisk.svg	\
	drive-removable-media.svg	\
	input-keyboard.svg	\
	input-mouse.svg	\
	media-floppy.svg	\
	media-cdrom.svg	\
	printer.svg	\
	video-display.svg	

EXTRA_DIST = $(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))
