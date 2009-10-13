themedir = $(datadir)/icons/gnome/256x256/emblems
theme_DATA =   emblem-package.png
EXTRA_DIST = $(theme_DATA)
install-data-local: install-themeDATA
	(cd "$(DESTDIR)$(themedir)" && $(ICONMAP) -c emblems )
MAINTAINERCLEANFILES = Makefile.in
