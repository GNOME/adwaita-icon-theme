
size = scalable
context = devices
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =			\
	audio-card.svg	\
	audio-input-microphone.svg	\
	battery.svg		\
	camera-photo.svg	\
	camera-video.svg	\
	camera-web.svg	\
	computer.svg		\
	drive-harddisk.svg	\
	drive-optical.svg	\
	drive-removable-media.svg	\
	input-gaming.svg	\
	input-keyboard.svg	\
	input-mouse.svg		\
	input-tablet.svg	\
	media-flash.svg		\
	media-floppy.svg	\
	media-optical.svg	\
	media-tape.svg	\
	media-zip.svg	\
	modem.svg		\
	multimedia-player.svg	\
	network-wired.svg	\
	network-wireless.svg	\
	pda.svg			\
	phone.svg		\
	printer.svg		\
	scanner.svg		\
	video-display.svg	

EXTRA_DIST = $(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

check:
	if test -r CVS/Entries; then \
		for icon in *.svg; do \
			if grep $$icon CVS/Entries > /dev/null; then \
				if ! grep $$icon Makefile > /dev/null; then \
					echo "Missing $$icon in Makefile.am"; \
					exit 1; \
				fi; \
			fi; \
		done; \
	else \
		for icon in *.svg; do \
			if ! grep $$icon Makefile > /dev/null; then \
				echo "Missing $$icon in Makefile.am"; \
				exit 1; \
			fi; \
		done; \
	fi
