
size = 24x24
context = apps
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	accessories-calculator.png	\
	accessories-character-map.png	\
	accessories-dictionary.png	\
	accessories-text-editor.png	\
	administration.png		\
	advanced-directory.png		\
	apacheconf.png			\
	applets-screenshooter.png	\
	boot.png			\
	character-picker.png		\
	display-capplet.png		\
	evolution-calendar.png		\
	evolution-mail.png		\
	evolution-tasks.png		\
	gdm.png				\
	gnome-amusements.png		\
	gnome-audio.png			\
	gnome-cpu.png			\
	gnome-desktop-config.png	\
	gnome-eyes.png			\
	gnome-favorites.png		\
	gnome-finance.png		\
	gnome-mini-commander.png	\
	gnome-networktool.png		\
	gnome-settings-sound.png	\
	gnome-settings-ui-behavior.png	\
	gnome-shutdown.png		\
	gnome-status.png		\
	gnome-unknown.png		\
	help-browser.png		\
	im-aim.png			\
	im-icq.png			\
	im-jabber.png			\
	im-msn.png			\
	im-nov.png			\
	im-yahoo.png			\
	logviewer.png			\
	multimedia-volume-control.png	\
	ooo_calc.png			\
	ooo_draw.png			\
	ooo_gulls.png			\
	ooo_impress.png			\
	ooo_math.png			\
	ooo_printeradmin.png		\
	ooo_template.png		\
	ooo_web.png			\
	ooo_writer.png			\
	postscript-viewer.png		\
	preferences-desktop-accessibility.png	\
	preferences-desktop-font.png	\
	preferences-desktop-keyboard.png	\
	preferences-desktop-keyboard-shortcuts.png	\
	preferences-desktop-locale.png	\
	preferences-desktop-theme.png	\
	preferences-desktop-remote-desktop.png	\
	preferences-desktop-screensaver.png	\
	preferences-desktop-wallpaper.png	\
	preferences-system-windows.png	\
	shares.png			\
	stock-ticker.png		\
	system-file-manager.png		\
	system-software-installer.png	\
	system-software-update.png	\
	system-users.png		\
	user-info.png	\
	utilities-system-monitor.png	\
	utilities-terminal.png		\
	web-browser.png

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
