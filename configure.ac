dnl Process this file with autoconf to produce a configure script.
AC_PREREQ(2.53)

AC_INIT([adwaita-icon-theme], [3.38.0],
        [http://bugzilla.gnome.org/enter_bug.cgi?product=adwaita-icon-theme])
AC_CANONICAL_HOST
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_SRCDIR([index.theme.in])

AM_INIT_AUTOMAKE([1.9 dist-xz no-dist-gzip tar-ustar foreign])

PKG_PROG_PKG_CONFIG([0.19])

GETTEXT_PACKAGE="${PACKAGE}"
AC_SUBST(GETTEXT_PACKAGE)

# Workaround to make aclocal get the right flags
AC_SUBST(ACLOCAL_AMFLAGS, "\${ACLOCAL_FLAGS}")

# Define the toplevel path here
AC_SUBST(themedir, "\${datadir}/icons/Adwaita")

# Input and Output dirs for the rendering
AC_SUBST(SVGOUTDIR, "Adwaita")
AC_SUBST(SVGSRCDIR, "src/symbolic")

# Icon sizes we want to install
AC_SUBST([render_sizes], ["8x8 16x16 22x22 24x24 32x32 48x48 256x256 512x512"])
AC_SUBST([symbolic_render_sizes], [""])
AC_SUBST([install_sizes], ["8x8 16x16 22x22 24x24 32x32 48x48 64x64 96x96 256x256 512x512"])

AC_PROG_LN_S
AC_PATH_PROG(GTK_UPDATE_ICON_CACHE, gtk-update-icon-cache)

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

symbolic_encode_sizes="16x16 24x24 32x32 48x48 64x64 96x96"
AC_PATH_PROG([GTK_ENCODE_SYMBOLIC_SVG], [gtk-encode-symbolic-svg], [false])
if test "x$GTK_ENCODE_SYMBOLIC_SVG" = "xfalse"; then
   symbolic_encode_sizes=""
fi
AC_SUBST(symbolic_encode_sizes)

case "$host" in
  *-*-mingw*|*-*-cygwin*)
    platform_win32=yes
    ;;
  *)
    platform_win32=no
    ;;
esac
AC_SUBST(platform_win32)
AM_CONDITIONAL([PLATFORM_WIN32], [test x$platform_win32 = xyes])

AC_ARG_ENABLE([l-xl-variants],
  [AS_HELP_STRING([--enable-l-xl-variants],
    [Also make and install Large and Extra Large Windows cursor versions])],
  [case "${enableval}" in
    yes) enable_l_xl_variants=yes ;;
    no)  enable_l_xl_variants=no ;;
    *) AC_MSG_ERROR([bad value ${enableval} for --enable-l-xl-variants]) ;;
   esac],
  [enable_l_xl_variants=no])
AC_SUBST(enable_l_xl_variants)
AM_CONDITIONAL([ENABLE_L_XL_VARIANTS], [test x$enable_l_xl_variants = xyes])

AC_CONFIG_FILES([
Makefile
adwaita-icon-theme.pc
src/Makefile
src/fullcolor/Makefile
src/symbolic/Makefile
src/spinner/Makefile
win32/Makefile
win32/adwaita-msvc.mak
])

AC_OUTPUT
