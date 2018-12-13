DISTCHECK_CONFIGURE_FLAGS = --disable-icon-mapping

SUBDIRS = src win32

ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}

cursordir = $(datadir)/icons/Adwaita/cursors

# Install .cur/.ani on Windows and X cursors everywhere else
win_cursors = $(wildcard $(srcdir)/Adwaita/cursors/*.cur) $(wildcard $(srcdir)/Adwaita/cursors/*.ani)
if PLATFORM_WIN32
cursor_DATA = $(win_cursors)
else
cursor_DATA = $(filter-out $(win_cursors), $(wildcard $(srcdir)/Adwaita/cursors/*))
endif

if ENABLE_L_XL_VARIANTS
cursorldir = $(datadir)/icons/Adwaita-Large/cursors
cursorl_DATA = $(wildcard $(srcdir)/Adwaita-Large/cursors/*)
cursorxldir = $(datadir)/icons/Adwaita-ExtraLarge/cursors
cursorxl_DATA = $(wildcard $(srcdir)/Adwaita-ExtraLarge/cursors/*)
else
cursorldir =
cursorl_DATA =
cursorxldir =
cursorxl_DATA =
endif

theme_in_files = index.theme.in
theme_DATA = $(theme_in_files:.theme.in=.theme)

THEME_DIRS=$(shell SIZES="$(install_sizes)"; for size in $$SIZES; do for dir in `find $(srcdir)/$(SVGOUTDIR)/$$size/* -type d`; do printf "$$dir,"; done; done; echo "scalable/actions,scalable/apps,scalable/categories,scalable/devices,scalable/emblems,scalable/emotes,scalable/mimetypes,scalable/places,scalable/status,scalable/legacy,scalable/ui,scalable-up-to-32/status,")

%.theme: %.theme.in $(SVGOUTDIR) Makefile
	dirs="`echo $(THEME_DIRS) | sed -e 's#$(srcdir)/Adwaita/##g'`"; \
	sed -e "s|\@THEME_DIRS\@|$$dirs|g" < $< > $@; \
	for dir in `echo $$dirs | sed -e "s/,/ /g"`; do \
		sizefull="`dirname $$dir`"; \
		if test "$$sizefull" = "scalable"; then \
			size="16"; \
		elif test "$$sizefull" = "scalable-up-to-32"; then \
			size="16"; \
		else \
			size="`echo $$sizefull | sed -e 's/x.*$$//g'`"; \
		fi; \
		context="`basename $$dir`"; \
		echo "[$$dir]" >> $@; \
		if test "$$context" = "actions"; then \
			echo "Context=Actions" >> $@; \
		fi; \
		if test "$$context" = "animations"; then \
			echo "Context=Animations" >> $@; \
		fi; \
		if test "$$context" = "apps"; then \
			echo "Context=Applications" >> $@; \
		fi; \
		if test "$$context" = "categories"; then \
			echo "Context=Categories" >> $@; \
		fi; \
		if test "$$context" = "devices"; then \
			echo "Context=Devices" >> $@; \
		fi; \
		if test "$$context" = "emblems"; then \
			echo "Context=Emblems" >> $@; \
		fi; \
		if test "$$context" = "emotes"; then \
			echo "Context=Emotes" >> $@; \
		fi; \
		if test "$$context" = "intl"; then \
			echo "Context=International" >> $@; \
		fi; \
		if test "$$context" = "mimetypes"; then \
			echo "Context=MimeTypes" >> $@; \
		fi; \
		if test "$$context" = "places"; then \
			echo "Context=Places" >> $@; \
		fi; \
		if test "$$context" = "status"; then \
			echo "Context=Status" >> $@; \
		fi; \
		if test "$$context" = "ui"; then \
			echo "Context=UI" >> $@; \
		fi; \
		if test "$$context" = "legacy"; then \
			echo "Context=Legacy" >> $@; \
		fi; \
		echo "Size=$$size" >> $@; \
		if test "$$sizefull" = "scalable"; then \
			echo "MinSize=8" >> $@; \
			echo "MaxSize=512" >> $@; \
			echo "Type=Scalable" >> $@; \
		elif test "$$sizefull" = "scalable-up-to-32"; then \
			echo "MinSize=16" >> $@; \
			echo "MaxSize=32" >> $@; \
			echo "Type=Scalable" >> $@; \
		elif test "$$size" = "256"; then \
			echo "MinSize=56" >> $@; \
			echo "MaxSize=256" >> $@; \
			echo "Type=Scalable" >> $@; \
		elif test "$$size" = "512"; then \
			echo "MinSize=56" >> $@; \
			echo "MaxSize=512" >> $@; \
			echo "Type=Scalable" >> $@; \
		else \
			echo "Type=Fixed" >> $@; \
		fi; \
		echo "" >> $@; \
	done

# Symbolic?
#THEME_DIRS=$(shell SIZES="$(render_sizes)"; for size in $$SIZES; do for dir in `find $(srcdir)/$(SVGOUTDIR)/$$size/* -type d`; do printf "$$dir,"; done; done | sed -e "s/,$$//g")

render: Makefile
	($(am__cd) $(SVGSRCDIR) && $(MAKE) $(AM_MAKEFLAGS) render) \
	|| eval `exit 1`

# we don't want to install mo files, all translations are already stored
# in theme files
install-data-local:
	if [ -h $(DESTDIR)$(themedir) ]; then \
		rm -f $(DESTDIR)$(themedir); \
	fi
	if [ -d $(DESTDIR)$(themedir) ]; then \
		touch $(DESTDIR)$(themedir); \
	fi

install-data-hook:
	cd $(DESTDIR)$(cursordir) && \
	if test "x$(platform_win32)" = "xyes"; \
	then \
		cur=.cur && \
		ani=.ani; \
	else \
		cur= && \
		ani= ; \
	fi; \
	if test "x$(enable_l_xl_variants)" = "xyes"; \
	then \
		themedirs="$(cursordir) $(cursorldir) $(cursorxldir)"; \
	else \
		themedirs="$(cursordir)"; \
	fi; \
	for d in $$themedirs; \
	do \
		cd $(DESTDIR)$$d && \
		echo Creating symlinks in $(DESTDIR)$$d && \
		$(LN_S) -f  dotbox$$cur			draped_box$$cur && \
		$(LN_S) -f  dotbox$$cur			icon$$cur && \
		$(LN_S) -f  dotbox$$cur			target$$cur && \
		$(LN_S) -f  dotbox$$cur			dot_box_mask$$cur && \
		$(LN_S) -f  X_cursor$$cur		pirate$$cur && \
		$(LN_S) -f  left_ptr_watch$$ani		08e8e1c95fe2fc01f976f1e063a24ccd$$ani && \
		$(LN_S) -f  left_ptr_watch$$ani		3ecb610c1bf2410f44200f48c40d3599$$ani && \
		$(LN_S) -f  left_ptr$$cur		arrow$$cur && \
		$(LN_S) -f  left_ptr$$cur		top_left_arrow$$cur && \
		$(LN_S) -f  right_ptr$$cur		draft_large$$cur && \
		$(LN_S) -f  right_ptr$$cur		draft_small$$cur && \
		$(LN_S) -f  move$$cur			4498f0e0c1937ffe01fd06f973665830$$cur && \
		$(LN_S) -f  move$$cur			9081237383d90e509aa00f00170e968f$$cur && \
		$(LN_S) -f  copy$$cur			1081e37283d90000800003c07f3ef6bf$$cur && \
		$(LN_S) -f  copy$$cur			6407b0e94181790501fd1e167b474872$$cur && \
		$(LN_S) -f  cross$$cur			cross_reverse$$cur && \
		$(LN_S) -f  cross$$cur			diamond_cross$$cur && \
		$(LN_S) -f  hand1$$cur			grab$$cur && \
		$(LN_S) -f  hand2$$cur			9d800788f1b08800ae810202380a0822$$cur && \
		$(LN_S) -f  hand2$$cur			e29285e634086352946a0e7090d73106$$cur && \
		$(LN_S) -f  hand2$$cur			hand$$cur && \
		$(LN_S) -f  all-scroll$$cur		fleur$$cur && \
		$(LN_S) -f  question_arrow$$cur		d9ce0ab605698f320427677b458ad60b$$cur && \
		$(LN_S) -f  question_arrow$$cur		5c6cd98b3f3ebcb1f9c7f1c204630408$$cur && \
		$(LN_S) -f  question_arrow$$cur		help$$cur && \
		$(LN_S) -f  question_arrow$$cur		left_ptr_help$$cur && \
		$(LN_S) -f  link$$cur			3085a0e285430894940527032f8b26df$$cur && \
		$(LN_S) -f  link$$cur			640fb0e74195791501fd1ed57b41487f$$cur && \
		$(LN_S) -f  crossed_circle$$cur		03b6e0fcb3499374a867c041f52298f0$$cur && \
		$(LN_S) -f  fd_double_arrow$$cur	fcf1c3c7cd4491d801f1e1c78f100000$$cur && \
		$(LN_S) -f  bd_double_arrow$$cur	c7088f0f3e6c8088236ef8e1e3e70000$$cur && \
		$(LN_S) -f  sb_h_double_arrow$$cur 	h_double_arrow$$cur && \
		$(LN_S) -f  sb_h_double_arrow$$cur	14fef782d02440884392942c11205230$$cur && \
		$(LN_S) -f  h_double_arrow$$cur		028006030e0e7ebffc7f7070c0600140$$cur && \
		$(LN_S) -f  sb_v_double_arrow$$cur 	double_arrow$$cur && \
		$(LN_S) -f  sb_v_double_arrow$$cur 	v_double_arrow$$cur && \
		$(LN_S) -f  sb_v_double_arrow$$cur	2870a09082c103050810ffdffffe0204$$cur && \
		$(LN_S) -f  v_double_arrow$$cur		00008160000006810000408080010102$$cur && \
		$(LN_S) -f  fleur$$cur			size_all$$cur && \
		$(LN_S) -f  fd_double_arrow$$cur	size_bdiag$$cur && \
		$(LN_S) -f  bd_double_arrow$$cur	size_fdiag$$cur && \
		$(LN_S) -f  h_double_arrow$$cur		size_hor$$cur && \
		$(LN_S) -f  v_double_arrow$$cur		size_ver$$cur && \
		$(LN_S) -f  left_ptr$$cur		default$$cur && \
		$(LN_S) -f  hand$$cur			pointer$$cur && \
		$(LN_S) -f  left_ptr_watch$$ani		progress$$ani && \
		$(LN_S) -f  watch$$ani			wait$$ani && \
		$(LN_S) -f  cross$$cur			crosshair$$cur && \
		$(LN_S) -f  xterm$$cur			text$$cur && \
		$(LN_S) -f  dnd-link$$cur		alias$$cur && \
		$(LN_S) -f  dnd-copy$$cur		copy$$cur && \
		$(LN_S) -f  dnd-no-drop$$cur		no-drop$$cur && \
		$(LN_S) -f  crossed_circle$$cur		not-allowed$$cur && \
		$(LN_S) -f  sb_h_double_arrow$$cur	col-resize$$cur && \
		$(LN_S) -f  sb_v_double_arrow$$cur	row-resize$$cur && \
		$(LN_S) -f  top_side$$cur		n-resize$$cur && \
		$(LN_S) -f  right_side$$cur		e-resize$$cur && \
		$(LN_S) -f  bottom_side$$cur		s-resize$$cur && \
		$(LN_S) -f  left_side$$cur		w-resize$$cur && \
		$(LN_S) -f  top_right_corner$$cur	ne-resize$$cur && \
		$(LN_S) -f  top_left_corner$$cur	nw-resize$$cur && \
		$(LN_S) -f  bottom_right_corner$$cur	se-resize$$cur && \
		$(LN_S) -f  bottom_left_corner$$cur	sw-resize$$cur && \
		$(LN_S) -f  sb_h_double_arrow$$cur	ew-resize$$cur && \
		$(LN_S) -f  sb_v_double_arrow$$cur	ns-resize$$cur && \
		$(LN_S) -f  fd_double_arrow$$cur	nesw-resize$$cur && \
		$(LN_S) -f  bd_double_arrow$$cur	nwse-resize$$cur; \
	done
	if test -z "$(DESTDIR)" && test -n "$(GTK_UPDATE_ICON_CACHE)" ; then \
		$(GTK_UPDATE_ICON_CACHE) -q $(DESTDIR)$(themedir); \
	fi

uninstall-hook:
	@rm -f  $(DESTDIR)$(themedir)/icon-theme.cache

pkgconfigdir = $(datadir)/pkgconfig
pkgconfig_DATA = adwaita-icon-theme.pc

EXTRA_DIST =			\
	adwaita-icon-theme.pc.in  \
	Adwaita			\
	COPYING_CCBYSA3		\
	COPYING_LGPL		\
	$(theme_in_files)

CLEANFILES = 			\
	$(theme_DATA)

MAINTAINERCLEANFILES =			\
	Makefile.in			\
	aclocal.m4			\
	config.guess			\
	config.h.in			\
	config.sub			\
	configure			\
	depcomp				\
	install-sh			\
	intltool-*.in			\
	libtool				\
	ltmain.sh			\
	missing				\
	mkinstalldirs

-include $(top_srcdir)/git.mk

