
size = 24x24
context = apps
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	accessibility-directory.png	\
	administration.png		\
	advanced-directory.png		\
	apacheconf.png			\
	applets-screenshooter.png	\
	beep-media-player.png		\
	boot.png			\
	burner.png			\
	character-picker.png		\
	clock.png			\
	config-language.png		\
	config-users.png		\
	display-capplet.png		\
	evolution.png			\
	evolution-calendar.png		\
	evolution-mail.png		\
	evolution-tasks.png		\
	gaim.png			\
	gdm.png				\
	gftp.png			\
	gnome-amusements.png		\
	gnome-applications.png		\
	gnome-audio.png			\
	gnome-calculator.png		\
	gnome-cdplayer-icon.png		\
	gnome-control-center.png	\
	gnome-cpu.png			\
	gnome-desktop-config.png	\
	gnome-devel.png			\
	gnome-eyes.png			\
	gnome-favorites.png		\
	gnome-finance.png		\
	gnome-globe.png			\
	gnome-gnomine.png		\
	gnome-graphics.png		\
	gnome-gsame.png			\
	gnome-help.png			\
	gnome-joystick.png		\
	gnome-lockscreen.png		\
	gnome-logout.png		\
	gnome-mini-commander.png	\
	gnome-modem.png			\
	gnome-money.png			\
	gnome-monitor.png		\
	gnome-multimedia.png		\
	gnome-netstatus-disconn.png	\
	gnome-netstatus-error.png	\
	gnome-netstatus-idle.png	\
	gnome-netstatus-rx.png		\
	gnome-netstatus-tx.png		\
	gnome-netstatus-txrx.png	\
	gnome-networktool.png		\
	gnome-nibbles.png		\
	gnome-office.png		\
	gnome-panel.png			\
	gnome-run.png			\
	gnome-searchtool.png		\
	gnome-session.png		\
	gnome-settings.png		\
	gnome-settings-font.png		\
	gnome-settings-keybindings.png	\
	gnome-settings-sound.png	\
	gnome-settings-theme.png	\
	gnome-settings-ui-behavior.png	\
	gnome-shutdown.png		\
	gnome-status.png		\
	gnome-terminal.png		\
	gnome-unknown.png		\
	gnome-window-manager.png	\
	image-viewer.png		\
	im-aim.png	\
	im-icq.png	\
	im-jabber.png	\
	im-msn.png	\
	im-nov.png	\
	im-yahoo.png	\
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
	panel-notification-area.png	\
	panel-window-list.png		\
	panel-window-menu.png		\
	postscript-viewer.png		\
	screensaver.png			\
	shares.png			\
	stock-ticker.png		\
	text-editor.png			\
	tsclient.png		\
	web-browser.png

EXTRA_DIST =		\
	$(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

