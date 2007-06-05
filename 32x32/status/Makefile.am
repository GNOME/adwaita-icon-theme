
size = 32x32
context = status

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =			\
	dialog-error.png	\
	dialog-information.png	\
	dialog-password.png	\
	dialog-warning.png	\
	folder-drag-accept.png	\
	folder-open.png		\
	folder-visiting.png	\
	image-loading.png	\
	image-missing.png	\
	mail-attachment.png	\
	network-error.png	\
	network-idle.png	\
	network-offline.png	\
	network-receive.png	\
	network-transmit.png	\
	network-transmit-receive.png	\
	printer-error.png	\
	printer-printing.png		\
	security-medium.png	\
	security-high.png	\
	task-due.png	\
	user-trash-full.png	\
	weather-clear.png	\
	weather-clear-night.png	\
	weather-few-clouds.png	\
	weather-few-clouds-night.png	\
	weather-overcast.png	\
	weather-severe-alert.png	\
	weather-showers.png	\
	weather-showers-scattered.png	\
	weather-snow.png	\
	weather-storm.png

EXTRA_DIST =				\
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
