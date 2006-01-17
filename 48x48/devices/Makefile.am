
size = 48x48
context = devices

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	battery.png			\
	computer.png			\
	drive-harddisk.png		\
	drive-removable-media.png	\
	input-keyboard.png		\
	input-mouse.png			\
	media-cdrom.png			\
	media-floppy.png		\
	media-jaz.png			\
	media-zip.png			\
	multimedia-player.png		\
	printer.png

EXTRA_DIST =				\
	$(icons_DATA)

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))
