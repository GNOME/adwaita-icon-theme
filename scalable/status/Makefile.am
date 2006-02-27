
size = scalable
context = status

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =			\
	folder-drag-accept.icon	\
	folder-drag-accept.svg	\
	folder-visiting.icon	\
	folder-visiting.svg	\
	user-trash-full.svg	\
	weather-clear.svg

EXTRA_DIST =		\
	$(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

