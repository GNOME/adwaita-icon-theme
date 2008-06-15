NULL=

size = 48x48
context = apps
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	applets-screenshooter.png	\
	gnome-settings-default-applications.png		\
	palm-pilot.png			\
	palm-pilot-sync.png		\
	visor.png			\
	$(NULL)

EXTRA_DIST = $(icons_DATA)

MAINTAINERCLEANFILES =			\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))
