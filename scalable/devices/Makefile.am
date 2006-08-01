
size = scalable
context = devices
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =			\
	battery.svg		\
	computer.svg		\
	drive-harddisk.svg	\
	drive-optical.svg	\
	drive-removable-media.svg	\
	input-keyboard.svg	\
	input-mouse.svg		\
	media-flash.svg		\
	media-floppy.svg	\
	media-optical.svg	\
	printer.svg		\
	video-display.svg	

EXTRA_DIST = $(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))
