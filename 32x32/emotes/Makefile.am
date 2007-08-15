
size = 32x32
context = emotes

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	face-angel.png \
	face-cool.png \
	face-crying.png \
	face-devilish.png \
	face-embarrassed.png \
	face-kiss.png \
	face-monkey.png \
	face-plain.png \
	face-raspberry.png \
	face-sad.png \
	face-smile-big.png \
	face-smile.png \
	face-smirk.png \
	face-surprise.png \
	face-wink.png

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
