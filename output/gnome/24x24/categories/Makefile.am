themedir = $(datadir)/icons/gnome/24x24/categories
theme_DATA =   applications-graphics.png applications-office.png preferences-system-network.png preferences-system.png
EXTRA_DIST = $(theme_DATA)
install-data-local: install-themeDATA
	(cd "$(DESTDIR)$(themedir)" && $(ICONMAP) -c categories )
MAINTAINERCLEANFILES = Makefile.in
