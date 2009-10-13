themedir = $(datadir)/icons/gnome/256x256/places
theme_DATA =   folder.png folder-remote.png folder-saved-search.png network-server.png network-workgroup.png user-home.png user-trash.png
EXTRA_DIST = $(theme_DATA)
install-data-local: install-themeDATA
	(cd "$(DESTDIR)$(themedir)" && $(ICONMAP) -c places )
MAINTAINERCLEANFILES = Makefile.in
