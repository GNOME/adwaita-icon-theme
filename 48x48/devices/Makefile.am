
size = 48x48
context = devices

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	media-jaz.png

EXTRA_DIST =				\
	$(icons_DATA)

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))
