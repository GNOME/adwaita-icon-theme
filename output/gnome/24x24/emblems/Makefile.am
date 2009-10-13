themedir = $(datadir)/icons/gnome/24x24/emblems
theme_DATA =   emblem-package.png emblem-readonly.png emblem-symbolic-link.png emblem-unreadable.png
EXTRA_DIST = $(theme_DATA)
install-data-local: install-themeDATA
	(cd "$(DESTDIR)$(themedir)" && $(ICONMAP) -c emblems )
MAINTAINERCLEANFILES = Makefile.in
