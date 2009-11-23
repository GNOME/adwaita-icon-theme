#!/bin/sh
# Run this to generate all the initial makefiles, etc.

srcdir=`dirname $0`
test -z "$srcdir" && srcdir=.

PKG_NAME="gnome-icon-theme"
REQUIRED_AUTOMAKE_VERSION=1.9

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
