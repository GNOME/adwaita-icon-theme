themedir = $(datadir)/icons/gnome/8x8/emblems
theme_DATA = emblem-default.svg emblem-readonly.svg emblem-symbolic-link.svg emblem-unreadable.svg  emblem-default.png emblem-new.png emblem-readonly.png emblem-symbolic-link.png emblem-unreadable.png
EXTRA_DIST = $(theme_DATA)
install-data-local: install-themeDATA
	(cd "$(DESTDIR)$(themedir)" && $(ICONMAP) -c emblems )
MAINTAINERCLEANFILES = Makefile.in
