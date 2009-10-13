themedir = $(datadir)/icons/gnome/24x24/actions
theme_DATA =   address-book-new.png bookmark-new.png document-new.png document-open.png document-page-setup.png document-print.png document-properties.png document-revert.png document-save-as.png document-save.png edit-delete.png edit-select-all.png folder-new.png go-next.png go-previous.png system-lock-screen.png system-log-out.png system-shutdown.png
EXTRA_DIST = $(theme_DATA)
install-data-local: install-themeDATA
	(cd "$(DESTDIR)$(themedir)" && $(ICONMAP) -c actions )
MAINTAINERCLEANFILES = Makefile.in
