
size = scalable
context = apps
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	accessories-calculator.svg	\
	accessories-character-map.svg	\
	accessories-dictionary.svg	\
	accessories-text-editor.svg	\
	gnome-shutdown.svg		\
	gnome-settings-ui-behavior.svg	\
	help-browser.svg		\
	im-aim.svg			\
	im-icq.svg			\
	im-jabber.svg			\
	im-msn.svg			\
	im-nov.svg			\
	im-yahoo.svg			\
	logviewer.svg			\
	multimedia-volume-control.svg	\
	preferences-desktop-accessibility.svg	\
	preferences-desktop-font.svg	\
	preferences-desktop-keyboard.svg	\
	preferences-desktop-keyboard-shortcuts.svg	\
	preferences-desktop-locale.svg	\
	preferences-desktop-remote-desktop.svg	\
	preferences-desktop-screensaver.svg	\
	preferences-desktop-theme.svg	\
	preferences-desktop-wallpaper.svg	\
	preferences-system-windows.svg	\
	system-file-manager.svg		\
	system-software-installer.svg	\
	system-software-update.svg	\
	system-users.svg		\
	user-info.svg	\
	utilities-system-monitor.svg	\
	utilities-terminal.svg		\
	web-browser.svg

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
