dnl Process this file with autoconf to produce a configure script.
AC_PREREQ(2.53)

AC_INIT([adwaita-icon-theme], [3.13.4],
        [http://bugzilla.gnome.org/enter_bug.cgi?product=adwaita-icon-theme])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_SRCDIR([index.theme.in.in])

AM_INIT_AUTOMAKE([1.9 dist-xz no-dist-gzip tar-ustar foreign])

PKG_PROG_PKG_CONFIG([0.19])
IT_PROG_INTLTOOL([0.40.0])

GETTEXT_PACKAGE="${PACKAGE}"
AC_SUBST(GETTEXT_PACKAGE)
localedir='$(prefix)/$(DATADIRNAME)/locale'
AC_SUBST(localedir)

# Workaround to make aclocal get the right flags
AC_SUBST(ACLOCAL_AMFLAGS, "\${ACLOCAL_FLAGS}")

# Define the toplevel path here
AC_SUBST(themedir, "\${datadir}/icons/Adwaita")

# Input and Output dirs for the rendering
AC_SUBST(SVGOUTDIR, "Adwaita")
AC_SUBST(SVGSRCDIR, "src/symbolic")

# Icon sizes we want to install
AC_SUBST([render_sizes], ["8x8 16x16 22x22 24x24 32x32 48x48 256x256"])
AC_SUBST([symbolic_render_sizes], [""])

AC_PATH_PROG(GTK_UPDATE_ICON_CACHE, gtk-update-icon-cache)
if test -z "$GTK_UPDATE_ICON_CACHE"; then
    AC_MSG_ERROR([Could not find gtk-update-icon-cache])
fi

# need git, icontool, and inkscape for rendering
allow_rendering=yes
AC_PATH_PROG([GIT], [git], [false])
if test "x$GIT" = "xfalse"; then
   allow_rendering=no
fi
AC_PATH_PROG([ICONTOOL_RENDER], [icontool-render], [false])
if test "x$ICONTOOL_RENDER" = "xfalse"; then
   allow_rendering=no
fi
AC_PATH_PROG([INKSCAPE], [inkscape], [false])
if test "x$INKSCAPE" = "xfalse"; then
   allow_rendering=no
fi
AM_CONDITIONAL(ALLOW_RENDERING, test "x$allow_rendering" = "xyes")

AC_CONFIG_FILES([
Makefile
adwaita-icon-theme.pc
po/Makefile.in
src/Makefile
src/fullcolor/Makefile
src/symbolic/Makefile
src/spinner/Makefile
])

AC_OUTPUT
