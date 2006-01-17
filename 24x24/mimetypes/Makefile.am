
size = 24x24
context = mimetypes

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =					\
	gnome-mime-application-x-gnome-saved-search.png	\
	image-x-generic.png

EXTRA_DIST =					\
	$(icons_DATA)

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))
