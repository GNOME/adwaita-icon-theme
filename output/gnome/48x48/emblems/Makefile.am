themedir = $(datadir)/icons/gnome/48x48/emblems
theme_DATA =   emblem-default.png emblem-desktop.png emblem-documents.png emblem-downloads.png emblem-favorite.png emblem-generic.png emblem-important.png emblem-mail.png emblem-new.png emblem-package.png emblem-photos.png emblem-readonly.png emblem-shared.png emblem-symbolic-link.png emblem-system.png emblem-unreadable.png emblem-urgent.png emblem-web.png
EXTRA_DIST = $(theme_DATA)
install-data-local: install-themeDATA
	(cd "$(DESTDIR)$(themedir)" && $(ICONMAP) -c emblems )
MAINTAINERCLEANFILES = Makefile.in
