dnl Process this file with autoconf to produce a configure script.
AC_PREREQ(2.53)

AC_INIT([gnome-icon-theme-symbolic], [3.5.4],
        [http://bugzilla.gnome.org/enter_bug.cgi?product=gnome-icon-theme])
AC_CONFIG_SRCDIR([src/gnome-stencils.svg])

AM_INIT_AUTOMAKE([1.9 tar-ustar foreign dist-bzip2 no-dist-gzip])

PKG_PROG_PKG_CONFIG([0.19])

# Workaround to make aclocal get the right flags
AC_SUBST(ACLOCAL_AMFLAGS, "\${ACLOCAL_FLAGS}")

# Define the toplevel path here
AC_SUBST(themedir, "\${datadir}/icons/gnome")

# Input and Output dirs for the rendering
AC_SUBST(SVGSRCDIR, "src")
AC_SUBST(SVGOUTDIR, "gnome")

# Icon sizes we want to install
AC_SUBST([render_sizes], [""])

# Allow icon mapping to be disabled
AC_ARG_ENABLE([icon-mapping],
	AC_HELP_STRING([--enable-icon-mapping],
			[Enable compatibility symlinks [default=auto]]),
	[enable_mapping=$enableval],
	[enable_mapping=yes])

ICONMAP="true"
if test "x$enable_mapping" != "xno"; then
   UTILS_REQUIRED=0.8.7

   AC_MSG_CHECKING([icon-naming-utils >= $UTILS_REQUIRED])
   PKG_CHECK_EXISTS(icon-naming-utils >= $UTILS_REQUIRED,
                    have_utils=yes, have_utils=no)
   if test "x$have_utils" = "xyes"; then
      UTILS_PATH="`$PKG_CONFIG --variable=program_path icon-naming-utils`"
      ICONMAP="$UTILS_PATH/icon-name-mapping"
      AC_MSG_RESULT([yes])
   else
      AC_MSG_RESULT([no])
      AC_MSG_ERROR([icon-naming-utils >= $UTILS_REQUIRED is required to build and install gnome-icon-theme-symbolic])
   fi
fi
AC_SUBST(ICONMAP)

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
src/Makefile
])

AC_OUTPUT
