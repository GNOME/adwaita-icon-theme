
size = 32x32
context = devices
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =			\
	audio-input-microphone.png	\
	battery.png		\
	camera-photo.png	\
	camera-web.png	\
	computer.png		\
	drive-harddisk.png	\
	drive-optical.png	\
	drive-removable-media.png	\
	input-keyboard.png	\
	input-mouse.png		\
	media-flash.png		\
	media-floppy.png	\
	media-optical.png	\
	media-tape.png		\
	modem.png		\
	multimedia-player.png	\
	printer.png	\
	video-display.png

EXTRA_DIST = $(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

check:
	if test -r CVS/Entries; then \
		for icon in *.png; do \
			if grep $$icon CVS/Entries > /dev/null; then \
				if ! grep $$icon Makefile > /dev/null; then \
					echo "Missing $$icon in Makefile.am"; \
					exit 1; \
				fi; \
			fi; \
		done; \
	else \
		for icon in *.png; do \
			if ! grep $$icon Makefile > /dev/null; then \
				echo "Missing $$icon in Makefile.am"; \
				exit 1; \
			fi; \
		done; \
	fi
