
size = 48x48
context = categories

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	applications-accessories.png	\
	applications-games.png		\
	applications-graphics.png	\
	applications-internet.png	\
	applications-multimedia.png	\
	applications-office.png		\
	applications-other.png		\
	applications-system.png		\
	preferences-desktop.png

EXTRA_DIST =				\
	$(icons_DATA)

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))
