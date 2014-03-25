dnl Process this file with autoconf to produce a configure script.
AC_PREREQ(2.53)

AC_INIT([gnome-icon-theme], [3.12.0],
        [http://bugzilla.gnome.org/enter_bug.cgi?product=gnome-icon-theme])
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
AC_SUBST(themedir, "\${datadir}/icons/gnome")

# Input and Output dirs for the rendering
AC_SUBST(SVGSRCDIR, "src")
AC_SUBST(SVGOUTDIR, "gnome")

# Icon sizes we want to install
AC_SUBST([render_sizes], ["8x8 16x16 22x22 24x24 32x32 48x48 256x256"])

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
      AC_MSG_ERROR([icon-naming-utils >= $UTILS_REQUIRED is required to build
                    and install gnome-icon-theme])
   fi
else
   ICONMAP="false"
fi

AC_SUBST(ICONMAP)

AC_PATH_PROG(GTK_UPDATE_ICON_CACHE, gtk-update-icon-cache)
if test -z "$GTK_UPDATE_ICON_CACHE"; then
    AC_MSG_ERROR([Could not find gtk-update-icon-cache])
fi

AC_CONFIG_FILES([
Makefile
gnome-icon-theme.pc
po/Makefile.in
src/Makefile
])

AC_OUTPUT
