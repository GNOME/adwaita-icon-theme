
size = 22x22
context = devices

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	audio-card.png	\
	audio-input-microphone.png	\
	battery.png			\
	camera-photo.png	\
	camera-video.png	\
	camera-web.png	\
	computer.png			\
	drive-harddisk.png		\
	drive-optical.png		\
	drive-removable-media.png	\
	input-gaming.png	\
	input-keyboard.png		\
	input-mouse.png			\
	input-tablet.png	\
	media-flash.png			\
	media-floppy.png		\
	media-optical.png		\
	media-tape.png	\
	media-zip.png	\
	modem.png		\
	multimedia-player.png		\
	network-wired.png		\
	network-wireless.png		\
	pda.png				\
	phone.png			\
	printer.png			\
	scanner.png			\
	video-display.png

EXTRA_DIST =		\
	$(icons_DATA)

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
