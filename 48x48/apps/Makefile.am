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
	gdm.png				\
	gnome-favorites.png		\
	gnome-finance.png		\
	gnome-networktool.png		\
	gnome-settings-default-applications.png		\
	hwbrowser.png			\
	network-config.png		\
	palm-pilot.png			\
	palm-pilot-sync.png		\
	serviceconf.png			\
	visor.png			\
	$(NULL)

EXTRA_DIST = $(icons_DATA)

MAINTAINERCLEANFILES =			\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))
