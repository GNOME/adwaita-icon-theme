NULL=

iconsize=48x48
category=emblems
icondir = $(datadir)/icons/gnome/$(iconsize)/$(category)

icon_in_files =				\
	emblem-art.icon.in		\
	emblem-camera.icon.in		\
	emblem-documents.icon.in	\
	emblem-mail.icon.in		\
	emblem-multimedia.icon.in	\
	emblem-package.icon.in		\
	emblem-pictures.icon.in		\
	emblem-sound.icon.in		\
	emblem-web.icon.in		\
	$(NULL)

icon_DATA =\
	emblem-art.png \
	emblem-camera.png \
	emblem-documents.png \
	emblem-mail.png \
	emblem-multimedia.png \
	emblem-noread.png \
	emblem-package.png \
	emblem-pictures.png \
	emblem-sound.png \
	emblem-symbolic-link.png \
	emblem-trash.png \
	emblem-web.png \
	$(icon_in_files:.icon.in=.icon)
	$(NULL)

%.icon:   %.icon.in   $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; $(INTLTOOL_MERGE) $(top_srcdir)/po $< $@ -d -u -c $(top_builddir)/po/.intltool-merge-cache

EXTRA_DIST = $(icon_DATA)
