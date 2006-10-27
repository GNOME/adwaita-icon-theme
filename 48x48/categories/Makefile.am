
size = 48x48
context = categories

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	applications-other.png		\
	applications-system.png		

EXTRA_DIST =				\
	$(icons_DATA)

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))
