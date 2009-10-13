themedir = $(datadir)/icons/gnome/48x48/categories
theme_DATA =   applications-accessories.png applications-development.png applications-engineering.png applications-games.png applications-graphics.png applications-internet.png applications-multimedia.png applications-office.png applications-other.png applications-science.png applications-system.png applications-utilities.png preferences-desktop-peripherals.png preferences-desktop-personal.png preferences-desktop.png preferences-other.png preferences-system-network.png preferences-system.png system-help.png
EXTRA_DIST = $(theme_DATA)
install-data-local: install-themeDATA
	(cd "$(DESTDIR)$(themedir)" && $(ICONMAP) -c categories )
MAINTAINERCLEANFILES = Makefile.in
