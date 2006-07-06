NULL=

size = 48x48
context = emblems
iconsdir = $(themedir)/$(size)/$(context)
pngdir = $(icondir)

icon_in_files =				\
	emblem-art.icon.in		\
	emblem-camera.icon.in		\
	emblem-certified.icon.in 	\
	emblem-cool.icon.in		\
	emblem-cvs-added.icon.in	\
	emblem-cvs-conflict.icon.in	\
	emblem-cvs-controlled.icon.in	\
	emblem-cvs-modified.icon.in	\
	emblem-cvs-new-file.icon.in	\
	emblem-cvs-removed.icon.in	\
	emblem-cvs-sticky-tag.icon.in	\
	emblem-danger.icon.in		\
	emblem-desktop.icon.in		\
	emblem-distinguished.icon.in	\
	emblem-documents.icon.in	\
	emblem-draft.icon.in		\
	emblem-handshake.icon.in	\
	emblem-marketing.icon.in	\
	emblem-money.icon.in		\
	emblem-multimedia.icon.in	\
	emblem-new.icon.in		\
	emblem-noread.icon.in		\
	emblem-note.icon.in		\
	emblem-nowrite.icon.in		\
	emblem-ohno.icon.in		\
	emblem-OK.icon.in 		\
	emblem-package.icon.in		\
	emblem-people.icon.in		\
	emblem-personal.icon.in		\
	emblem-pictures.icon.in		\
	emblem-plan.icon.in		\
	emblem-presentation.icon.in	\
	emblem-sales.icon.in		\
	emblem-shared.icon.in		\
	emblem-sound.icon.in		\
	emblem-trash.icon.in		\
	emblem-web.icon.in		\
	$(NULL)

icons_DATA = $(icon_in_files:.icon.in=.icon)

png_DATA =				\
	emblem-art.png			\
	emblem-cool.png			\
	emblem-camera.png		\
	emblem-certified.png		\
	emblem-cvs-added.png		\
	emblem-cvs-conflict.png 	\
	emblem-cvs-controlled.png 	\
	emblem-cvs-modified.png 	\
	emblem-cvs-new-file.png		\
	emblem-cvs-removed.png		\
	emblem-cvs-sticky-tag.png 	\
	emblem-danger.png		\
	emblem-desktop.png		\
	emblem-distinguished.png	\
	emblem-documents.png		\
	emblem-draft.png		\
	emblem-handshake.png		\
	emblem-marketing.png		\
	emblem-money.png		\
	emblem-multimedia.png		\
	emblem-new.png			\
	emblem-note.png			\
	emblem-noread.png		\
	emblem-nowrite.png		\
	emblem-ohno.png			\
	emblem-OK.png			\
	emblem-package.png		\
	emblem-people.png		\
	emblem-personal.png		\
	emblem-pictures.png		\
	emblem-plan.png			\
	emblem-presentation.png		\
	emblem-sales.png		\
	emblem-shared.png		\
	emblem-sound.png		\
	emblem-trash.png		\
	emblem-web.png			\
	$(NULL)

%.icon:   %.icon.in   $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; $(INTLTOOL_MERGE) $(top_srcdir)/po $< $@ -d -u -c $(top_builddir)/po/.intltool-merge-cache

EXTRA_DIST = $(icon_in_files) $(png_DATA)

CLEANFILES = $(icons_DATA)

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))
