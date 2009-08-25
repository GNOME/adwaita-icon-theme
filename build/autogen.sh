#!/bin/sh
# Run this to generate all the initial makefiles, etc.

srcdir=`dirname $0`
test -z "$srcdir" && srcdir=.

PKG_NAME="gnome-icon-theme"
REQUIRED_AUTOMAKE_VERSION=1.9

(test -f $srcdir/configure.in \
  && test -f $srcdir/index.theme.in \
  && test -d $srcdir/48x48) || {
    echo -n "**Error**: Directory "\`$srcdir\'" does not look like the"
    echo " top-level $PKG_NAME directory"
    exit 1
}

gettext=`which gettext`
gettext_prefix=`dirname $gettext | xargs dirname`

if [ -x $gettext_prefix/share/gettext/mkinstalldirs ]; then
    cp $gettext_prefix/share/gettext/mkinstalldirs $srcdir
fi

which gnome-autogen.sh || {
    echo "You need to install gnome-common from the GNOME CVS"
    exit 1
}
USE_GNOME2_MACROS=1 . gnome-autogen.sh
