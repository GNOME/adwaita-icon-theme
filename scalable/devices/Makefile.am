
size = scalable
context = devices
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =	\
	drive-cdrom.svg	\
	drive-harddisk.svg	\
	drive-removable-media.svg	\
	media-cdrom.svg

EXTRA_DIST = $(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))
