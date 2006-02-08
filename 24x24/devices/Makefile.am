
size = 24x24
context = devices

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	audio-input-microphone.png	\
	battery.png			\
	input-mouse.png			\
	multimedia-player.png		\
	network-wired.png		\
	network-wireless.png		\
	printer.png

EXTRA_DIST =		\
	$(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))
