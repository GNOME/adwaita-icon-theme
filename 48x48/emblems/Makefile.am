NULL=

size = 48x48
context = emblems
iconsdir = $(themedir)/$(size)/$(context)
pngdir = $(iconsdir)

icon_in_files =				\
	emblem-art.icon.in		\
	emblem-certified.icon.in 	\
	emblem-cool.icon.in		\
	emblem-danger.icon.in		\
	emblem-marketing.icon.in	\
	emblem-money.icon.in		\
	emblem-multimedia.icon.in	\
	emblem-ohno.icon.in		\
	emblem-personal.icon.in		\
	emblem-plan.icon.in		\
	emblem-sales.icon.in		\
	$(NULL)

icons_DATA = $(icon_in_files:.icon.in=.icon)

png_DATA =				\
	emblem-art.png			\
	emblem-cool.png			\
	emblem-certified.png		\
	emblem-danger.png		\
	emblem-marketing.png		\
	emblem-money.png		\
	emblem-multimedia.png		\
	emblem-ohno.png			\
	emblem-personal.png		\
	emblem-plan.png			\
	emblem-sales.png		\
	$(NULL)

%.icon:   %.icon.in   $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; $(INTLTOOL_MERGE) $(top_srcdir)/po $< $@ -d -u -c $(top_builddir)/po/.intltool-merge-cache

EXTRA_DIST = $(icon_in_files) $(png_DATA)

CLEANFILES = $(icons_DATA)
