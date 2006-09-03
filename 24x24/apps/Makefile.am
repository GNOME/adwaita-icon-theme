
size = 24x24
context = apps
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	accessories-calculator.png	\
	administration.png		\
	advanced-directory.png		\
	apacheconf.png			\
	applets-screenshooter.png	\
	boot.png			\
	character-picker.png		\
	config-language.png		\
	config-users.png		\
	display-capplet.png		\
	evolution.png			\
	evolution-calendar.png		\
	evolution-mail.png		\
	evolution-tasks.png		\
	gdm.png				\
	gnome-amusements.png		\
	gnome-applications.png		\
	gnome-audio.png			\
	gnome-cpu.png			\
	gnome-desktop-config.png	\
	gnome-eyes.png			\
	gnome-favorites.png		\
	gnome-finance.png		\
	gnome-logout.png		\
	gnome-mini-commander.png	\
	gnome-networktool.png		\
	gnome-searchtool.png		\
	gnome-session.png		\
	gnome-settings-keybindings.png	\
	gnome-settings-sound.png	\
	gnome-settings-ui-behavior.png	\
	gnome-shutdown.png		\
	gnome-status.png		\
	gnome-unknown.png		\
	gnome-window-manager.png	\
	help-browser.png		\
	image-viewer.png		\
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
	preferences-desktop-theme.png	\
	preferences-desktop-wallpaper.png	\
	preferences-desktop-screensaver.png	\
	shares.png			\
	stock-ticker.png		\
	system-file-manager.png		\
	text-editor.png			\
	utilities-system-monitor.png	\
	utilities-terminal.png		\
	web-browser.png

EXTRA_DIST =		\
	$(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

