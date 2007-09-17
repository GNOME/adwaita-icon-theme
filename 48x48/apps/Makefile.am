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
	gnome-networktool.png		\
	gnome-pdf.png			\
	gnome-searchtool-animation.png	\
	gnome-searchtool-animation-rest.png	\
	gnome-server-config.png		\
	gnome-settings-sound.png	\
	gnome-settings-accessibility-keyboard.png	\
	gnome-settings-default-applications.png		\
	gnome-system-config.png		\
	gnome-unknown.png		\
	hint.png			\
	hwbrowser.png			\
	im.png				\
	launcher-program.png		\
	network-config.png		\
	palm-pilot.png			\
	palm-pilot-sync.png		\
	postscript-viewer.png		\
	serviceconf.png			\
	stock-ticker.png		\
	visor.png			\
	$(NULL)

EXTRA_DIST = $(icons_DATA)

MAINTAINERCLEANFILES =			\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))
