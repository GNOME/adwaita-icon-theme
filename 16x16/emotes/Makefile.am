size = 16x16
context = emotes

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	face-angel.png			\
	face-crying.png			\
	face-devil.png			\
	face-glasses.png		\
	face-grin.png			\
	face-monkey.png			\
	face-plain.png			\
	face-sad.png			\
	face-smile.png			\
	face-smile-big.png		\
	face-suprise.png		\
	face-wink.png

EXTRA_DIST = $(icons_DATA)

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
