themedir = $(datadir)/icons/gnome/24x24/status
theme_DATA =   battery-caution.png battery-charging.png battery-full.png battery-good.png battery-low.png dialog-warning.png folder-drag-accept.png folder-open.png folder-visiting.png image-loading.png image-missing.png network-error.png network-idle.png network-offline.png network-receive.png network-transmit.png network-transmit-receive.png printer-error.png printer-printing.png software-update-available.png software-update-urgent.png user-away.png user-busy.png user-idle.png user-invisible.png user-offline.png user-online.png user-trash-full.png
EXTRA_DIST = $(theme_DATA)
install-data-local: install-themeDATA
	(cd "$(DESTDIR)$(themedir)" && $(ICONMAP) -c status )
MAINTAINERCLEANFILES = Makefile.in
