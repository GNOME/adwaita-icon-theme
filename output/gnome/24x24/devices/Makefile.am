themedir = $(datadir)/icons/gnome/24x24/devices
theme_DATA =   ac-adapter.png battery.png camera-photo.png computer.png drive-harddisk.png drive-optical.png drive-removable-media.png input-keyboard.png media-flash.png media-optical.png multimedia-player.png printer.png video-display.png
EXTRA_DIST = $(theme_DATA)
install-data-local: install-themeDATA
	(cd "$(DESTDIR)$(themedir)" && $(ICONMAP) -c devices )
MAINTAINERCLEANFILES = Makefile.in
