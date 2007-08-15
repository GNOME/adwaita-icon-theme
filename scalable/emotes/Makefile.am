
size = scalable
context = emotes
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	face-angel.svg \
	face-cool.svg \
	face-crying.svg \
	face-devilish.svg \
	face-embarrassed.svg \
	face-kiss.svg \
	face-monkey.svg \
	face-plain.svg \
	face-raspberry.svg \
	face-sad.svg \
	face-smile-big.svg \
	face-smile.svg \
	face-smirk.svg \
	face-surprise.svg \
	face-wink.svg

EXTRA_DIST =		\
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
