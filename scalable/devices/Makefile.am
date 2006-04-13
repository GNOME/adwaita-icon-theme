
size = scalable
context = devices
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =	\
	drive-cdrom.svg	\
	drive-harddisk.svg	\
	drive-removable-media.svg	\
	input-keyboard.svg	\
	media-cdrom.svg	\
	video-display.svg	

EXTRA_DIST = $(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))
