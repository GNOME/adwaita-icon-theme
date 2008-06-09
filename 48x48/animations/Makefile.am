
size = 48x48
context = animations

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =			\
	process-idle.png	\
	process-working.png

EXTRA_DIST =		\
	$(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))
	(cd $(DESTDIR)$(themedir)/$(size)/$(context) && \
		ln -s process-idle.png gnome-searchtool-animation-rest.png && \
		ln -s process-working.png gnome-searchtool-animation.png \
	)
