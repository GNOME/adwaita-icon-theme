
size = 32x32
context = devices
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =			\
	battery.png		\
	drive-harddisk.png	\
	drive-optical.png	\
	drive-removable-media.png	\
	input-keyboard.png	\
	input-mouse.png		\
	media-flash.png		\
	media-floppy.png	\
	media-optical.png	\
	printer.png

EXTRA_DIST = $(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))
