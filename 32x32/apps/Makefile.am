
size = 32x32
context = apps

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	accessories-text-editor.png	\
	evolution.png			\
	help-browser.png		\
	logviewer.png			\
	preferences-desktop-screensaver.png	\
	system-file-manager.png		\
	utilities-system-monitor.png	\
	utilities-terminal.png

EXTRA_DIST =		\
	$(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

