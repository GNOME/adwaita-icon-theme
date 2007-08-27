
size = scalable
context = categories
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	applications-accessories.svg	\
	applications-development.svg	\
	applications-engineering.svg	\
	applications-games.svg		\
	applications-graphics.svg	\
	applications-internet.svg	\
	applications-multimedia.svg	\
	applications-office.svg		\
	applications-other.svg		\
	applications-science.svg	\
	applications-system.svg	\
	applications-utilities.svg	\
	preferences-desktop.svg	\
	preferences-desktop-peripherals.svg	\
	preferences-desktop-personal.svg	\
	preferences-other.svg \
	preferences-system.svg		\
	preferences-system-network.svg \
	system-help.svg

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
