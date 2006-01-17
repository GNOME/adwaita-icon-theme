
size = 48x48
context = actions

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	appointment-new.png		\
	document-print.png		\
	document-print-preview.png	\
	go-home.png			\
	mail-mark-junk.png		\
	mail-mark-not-junk.png		\
	mail-message-new.png		\
	mail-send-receive.png

EXTRA_DIST =				\
	$(icons_DATA)

MAINTAINERCLEANFILES =			\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

