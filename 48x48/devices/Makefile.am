
size = 48x48
context = devices

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	ac-adapter.png			\
	battery.png			\
	camera-photo.png		\
	computer.png			\
	drive-harddisk.png		\
	drive-optical.png		\
	drive-removable-media.png	\
	drive-removable.png		\
	input-keyboard.png		\
	media-flash.png			\
	media-jaz.png			\
	media-optical.png		\
	multimedia-player.png		\
	printer.png			\
	video-display.png

EXTRA_DIST =				\
	$(icons_DATA)

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

-include $(top_srcdir)/git.mk
