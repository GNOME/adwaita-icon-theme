NULL=

iconsize=48x48
category=emblems
icondir = $(datadir)/icons/gnome/$(iconsize)/$(category)

icon_in_files =				\
	emblem-art.icon.in		\
	emblem-bin.icon.in		\
	emblem-cool.icon.in		\
	emblem-camera.icon.in		\
	emblem-certified.icon.in 	\
	emblem-danger.icon.in		\
	emblem-documents.icon.in	\
	emblem-favorite.icon.in		\
	emblem-generic.icon.in 		\
	emblem-handshake.icon.in	\
	emblem-important.icon.in 	\
	emblem-mail.icon.in		\
	emblem-marketing.icon.in	\
	emblem-money.icon.in		\
	emblem-multimedia.icon.in	\
	emblem-ohno.icon.in		\
	emblem-OK.icon.in 		\
	emblem-package.icon.in		\
	emblem-people.icon.in		\
	emblem-pictures.icon.in		\
	emblem-plan.icon.in		\
	emblem-presentation.icon.in	\
	emblem-sales.icon.in		\
	emblem-sound.icon.in		\
	emblem-special.icon.in 		\
	emblem-web.icon.in		\
	$(NULL)

icon_DATA =\
	emblem-art.png			\
	emblem-bin.png			\
	emblem-cool.png			\
	emblem-camera.png		\
	emblem-certified.png		\
	emblem-danger.png		\
	emblem-desktop.png		\
	emblem-documents.png		\
	emblem-favorite.png		\
	emblem-generic.png		\
	emblem-handshake.png		\
	emblem-important.png 		\
	emblem-mail.png			\
	emblem-marketing.png		\
	emblem-money.png		\
	emblem-multimedia.png		\
	emblem-note.png			\
	emblem-noread.png		\
	emblem-nowrite.png		\
	emblem-ohno.png			\
	emblem-OK.png			\
	emblem-package.png		\
	emblem-people.png		\
	emblem-pictures.png		\
	emblem-plan.png			\
	emblem-presentation.png		\
	emblem-sales.png		\
	emblem-sound.png		\
	emblem-special.png		\
	emblem-symbolic-link.png	\
	emblem-trash.png		\
	emblem-web.png			\
	$(icon_in_files:.icon.in=.icon)
	$(NULL)

%.icon:   %.icon.in   $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; $(INTLTOOL_MERGE) $(top_srcdir)/po $< $@ -d -u -c $(top_builddir)/po/.intltool-merge-cache

EXTRA_DIST = $(icon_DATA)
