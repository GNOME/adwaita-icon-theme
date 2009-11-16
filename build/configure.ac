AC_PREREQ(2.53)

#FIXME make it work ;)
#RELVER=`git describe --abbrev=0`
#AC_INIT([moblin-icon-theme], $RELVER)

AC_INIT([gnome-osd-icons], 0.0.1)
AC_CONFIG_SRCDIR([24x24])

AM_INIT_AUTOMAKE([1.9 tar-ustar])

# Define the toplevel path here
AC_SUBST(themedir, "\${datadir}/icons/")

UTILS_REQUIRED=0.8.7

AC_MSG_CHECKING([icon-naming-utils >= $UTILS_REQUIRED])
PKG_CHECK_EXISTS(icon-naming-utils >= $UTILS_REQUIRED,
                 have_utils=yes, have_utils=no)
if test "x$have_utils" = "xyes"; then
   UTILS_PATH="`$PKG_CONFIG --variable=program_path icon-naming-utils`"
   ICONMAP="$UTILS_PATH/icon-name-mapping"
   AC_SUBST(ICONMAP)
   AC_MSG_RESULT([yes])
else
   AC_MSG_RESULT([no])
   AC_MSG_ERROR([icon-naming-utils >= $UTILS_REQUIRED is required to build
                 and install sato-icon-theme])
fi


AC_CONFIG_FILES([
MAKEFILES
])

AC_OUTPUT
