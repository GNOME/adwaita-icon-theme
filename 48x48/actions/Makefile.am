
size = 48x48
context = actions

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	mail-mark-junk.png		\
	mail-mark-not-junk.png

EXTRA_DIST =				\
	$(icons_DATA)

MAINTAINERCLEANFILES =			\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))


-include $(top_srcdir)/git.mk
