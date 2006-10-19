NULL=

size = 48x48
context = apps
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	administration.png		\
	advanced-directory.png		\
	apacheconf.png			\
	applets-screenshooter.png	\
	character-picker.png		\
	config-date.png			\
	config-language.png		\
	config-users.png		\
	config-xfree.png		\
	disks.png			\
	eyes.png			\
	gdm.png				\
	gnome-amusements.png		\
	gnome-audio.png			\
	gnome-desktop-config.png 	\
	gnome-favorites.png		\
	gnome-finance.png		\
	gnome-grecord.png		\
	gnome-logout.png		\
	gnome-networktool.png		\
	gnome-pdf.png			\
	gnome-searchtool.png		\
	gnome-searchtool-animation.png	\
	gnome-searchtool-animation-rest.png	\
	gnome-server-config.png		\
	gnome-session.png		\
	gnome-settings-keybindings.png	\
	gnome-settings-ui-behavior.png	\
	gnome-settings-sound.png	\
	gnome-settings-accessibility-keyboard.png	\
	gnome-settings-default-applications.png		\
	gnome-system-config.png		\
	gnome-unknown.png		\
	gnome-window-manager.png	\
	hint.png			\
	hwbrowser.png			\
	im.png				\
	image-viewer.png		\
	launcher-program.png		\
	network-config.png		\
	palm-pilot.png			\
	palm-pilot-sync.png		\
	postscript-viewer.png		\
	preferences-desktop-accessibility.png	\
	preferences-desktop-font.png	\
	preferences-desktop-theme.png	\
	serviceconf.png			\
	stock-ticker.png		\
	user-info.png			\
	visor.png			\
	$(NULL)

EXTRA_DIST = $(icons_DATA)

MAINTAINERCLEANFILES =			\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))
