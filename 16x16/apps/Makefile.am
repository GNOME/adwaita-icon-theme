size = 16x16
context = apps

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	accessories-calculator.png	\
	accessories-character-map.png	\
	accessories-dictionary.png	\
	accessories-text-editor.png	\
	applets-screenshooter.png	\
	boot.png			\
	gnome-settings-ui-behavior.png	\
	gnome-shutdown.png		\
	help-browser.png		\
	im.png				\
	im-aim.png			\
	im-icq.png			\
	im-jabber.png			\
	im-msn.png			\
	im-nov.png			\
	im-yahoo.png			\
	logviewer.png			\
	multimedia-volume-control.png	\
	preferences-desktop-accessibility.png	\
	preferences-desktop-font.png	\
	preferences-desktop-keyboard.png	\
	preferences-desktop-keyboard-shortcuts.png	\
	preferences-desktop-locale.png	\
	preferences-desktop-remote-desktop.png	\
	preferences-desktop-screensaver.png	\
	preferences-desktop-theme.png	\
	preferences-desktop-wallpaper.png	\
	preferences-system-windows.png	\
	system-file-manager.png		\
	system-software-installer.png	\
	system-software-update.png	\
	system-users.png	\
	user-info.png	\
	utilities-system-monitor.png	\
	utilities-terminal.png		\
	web-browser.png

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
