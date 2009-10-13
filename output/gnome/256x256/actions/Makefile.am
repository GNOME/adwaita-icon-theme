themedir = $(datadir)/icons/gnome/256x256/actions
theme_DATA =   address-book-new.png document-new.png document-open.png document-page-setup.png document-print.png document-properties.png document-revert.png edit-delete.png edit-select-all.png folder-new.png system-lock-screen.png system-log-out.png
EXTRA_DIST = $(theme_DATA)
install-data-local: install-themeDATA
	(cd "$(DESTDIR)$(themedir)" && $(ICONMAP) -c actions )
MAINTAINERCLEANFILES = Makefile.in
