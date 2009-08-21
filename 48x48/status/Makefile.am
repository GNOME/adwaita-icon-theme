
size = 48x48
context = status

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	audio-volume-high.png		\
	audio-volume-low.png		\
	audio-volume-medium.png		\
	audio-volume-muted.png		\
	battery-caution.png		\
	battery-charging.png		\
	battery-critical.png		\
	battery-full.png		\
	battery-good.png		\
	battery-low.png			\
	dialog-error.png		\
	dialog-warning.png		\
	folder-drag-accept.png		\
	folder-open.png			\
	folder-visiting.png		\
	image-loading.png		\
	image-missing.png		\
	network-error.png		\
	network-idle.png		\
	network-offline.png		\
	network-receive.png		\
	network-transmit.png		\
	network-transmit-receive.png	\
	printer-error.png		\
	printer-printing.png		\
	software-update-available.png	\
	software-update-urgent.png	\
	user-away.png			\
	user-busy.png			\
	user-idle.png			\
	user-invisible.png		\
	user-offline.png		\
	user-online.png			\
	user-trash-full.png

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

-include $(top_srcdir)/git.mk
