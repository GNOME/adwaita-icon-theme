
size = 32x32
context = mimetypes

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	application-certificate.png

EXTRA_DIST =		\
	$(icons_DATA)

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))
