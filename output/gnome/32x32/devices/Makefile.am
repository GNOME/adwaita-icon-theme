themedir = $(datadir)/icons/gnome/32x32/devices
theme_DATA =   ac-adapter.png audio-card.png audio-input-microphone.png battery.png camera-photo.png camera-video.png camera-web.png computer.png drive-harddisk.png drive-optical.png drive-removable-media.png input-gaming.png input-keyboard.png input-mouse.png input-tablet.png media-flash.png media-floppy.png media-optical.png media-tape.png media-zip.png modem.png multimedia-player.png network-wired.png network-wireless.png pda.png phone.png printer.png scanner.png video-display.png
EXTRA_DIST = $(theme_DATA)
install-data-local: install-themeDATA
	(cd "$(DESTDIR)$(themedir)" && $(ICONMAP) -c devices )
MAINTAINERCLEANFILES = Makefile.in
