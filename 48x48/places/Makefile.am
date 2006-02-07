
size = 48x48
context = places

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =			\
	network-server.png	\
	network-workgroup.png	\
	user-desktop.png	

EXTRA_DIST =			\
	$(icons_DATA)

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

