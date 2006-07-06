
size = 32x32
context = devices
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =	\
	battery.png	\
	drive-cdrom.png	\
	drive-harddisk.png	\
	drive-removable-media.png	\
	input-keyboard.png	\
	input-mouse.png	\
	media-floppy.png	\
	media-cdrom.png	\
	printer.png	\
	video-display.png	

EXTRA_DIST = $(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))
