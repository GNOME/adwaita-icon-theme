
size = 32x32
context = categories

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	applications-accessories.png	\
	applications-development.png	\
	applications-engineering.png	\
	applications-games.png		\
	applications-graphics.png	\
	applications-internet.png	\
	applications-multimedia.png	\
	applications-office.png		\
	applications-other.png	\
	applications-science.png	\
	applications-system.png	\
	applications-utilities.png	\
	preferences-desktop.png	\
	preferences-desktop-peripherals.png	\
	preferences-desktop-personal.png \
	preferences-other.png	\
	preferences-system.png		\
	preferences-system-network.png \
	system-help.png

EXTRA_DIST =				\
	$(icons_DATA)

MAINTAINERCLEANFILES =			\
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
