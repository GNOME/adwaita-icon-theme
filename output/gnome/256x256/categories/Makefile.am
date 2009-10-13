themedir = $(datadir)/icons/gnome/256x256/categories
theme_DATA =   applications-graphics.png applications-internet.png applications-office.png preferences-system-network.png preferences-system.png
EXTRA_DIST = $(theme_DATA)
install-data-local: install-themeDATA
	(cd "$(DESTDIR)$(themedir)" && $(ICONMAP) -c categories )
MAINTAINERCLEANFILES = Makefile.in
