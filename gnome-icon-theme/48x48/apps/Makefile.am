
size = 48x48
context = apps
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	accessories-calculator.png	\
	accessories-text-editor.png	\
	applets-screenshooter.png	\
	help-browser.png		\
	palm-pilot.png			\
	palm-pilot-sync.png		\
	preferences-desktop-accessibility.png	\
	preferences-desktop-keyboard.png	\
	preferences-desktop-screensaver.png	\
	system-software-install.png	\
	user-info.png			\
	visor.png

EXTRA_DIST = $(icons_DATA)

MAINTAINERCLEANFILES =			\
	Makefile.in

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

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

-include $(top_srcdir)/git.mk
