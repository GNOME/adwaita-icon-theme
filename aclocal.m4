dnl aclocal.m4 generated automatically by aclocal 1.4-p5

dnl Copyright (C) 1994, 1995-8, 1999, 2001 Free Software Foundation, Inc.
dnl This file is free software; the Free Software Foundation
dnl gives unlimited permission to copy and/or distribute it,
dnl with or without modifications, as long as this notice is preserved.

dnl This program is distributed in the hope that it will be useful,
dnl but WITHOUT ANY WARRANTY, to the extent permitted by law; without
dnl even the implied warranty of MERCHANTABILITY or FITNESS FOR A
dnl PARTICULAR PURPOSE.

# Do all the work for Automake.  This macro actually does too much --
# some checks are only needed if your package does certain things.
# But this isn't really a big deal.

# serial 1

dnl Usage:
dnl AM_INIT_AUTOMAKE(package,version, [no-define])

AC_DEFUN([AM_INIT_AUTOMAKE],
[AC_REQUIRE([AC_PROG_INSTALL])
PACKAGE=[$1]
AC_SUBST(PACKAGE)
VERSION=[$2]
AC_SUBST(VERSION)
dnl test to see if srcdir already configured
if test "`cd $srcdir && pwd`" != "`pwd`" && test -f $srcdir/config.status; then
  AC_MSG_ERROR([source directory already configured; run "make distclean" there first])
fi
ifelse([$3],,
AC_DEFINE_UNQUOTED(PACKAGE, "$PACKAGE", [Name of package])
AC_DEFINE_UNQUOTED(VERSION, "$VERSION", [Version number of package]))
AC_REQUIRE([AM_SANITY_CHECK])
AC_REQUIRE([AC_ARG_PROGRAM])
dnl FIXME This is truly gross.
missing_dir=`cd $ac_aux_dir && pwd`
AM_MISSING_PROG(ACLOCAL, aclocal, $missing_dir)
AM_MISSING_PROG(AUTOCONF, autoconf, $missing_dir)
AM_MISSING_PROG(AUTOMAKE, automake, $missing_dir)
AM_MISSING_PROG(AUTOHEADER, autoheader, $missing_dir)
AM_MISSING_PROG(MAKEINFO, makeinfo, $missing_dir)
AC_REQUIRE([AC_PROG_MAKE_SET])])

#
# Check to make sure that the build environment is sane.
#

AC_DEFUN([AM_SANITY_CHECK],
[AC_MSG_CHECKING([whether build environment is sane])
# Just in case
sleep 1
echo timestamp > conftestfile
# Do `set' in a subshell so we don't clobber the current shell's
# arguments.  Must try -L first in case configure is actually a
# symlink; some systems play weird games with the mod time of symlinks
# (eg FreeBSD returns the mod time of the symlink's containing
# directory).
if (
   set X `ls -Lt $srcdir/configure conftestfile 2> /dev/null`
   if test "[$]*" = "X"; then
      # -L didn't work.
      set X `ls -t $srcdir/configure conftestfile`
   fi
   if test "[$]*" != "X $srcdir/configure conftestfile" \
      && test "[$]*" != "X conftestfile $srcdir/configure"; then

      # If neither matched, then we have a broken ls.  This can happen
      # if, for instance, CONFIG_SHELL is bash and it inherits a
      # broken ls alias from the environment.  This has actually
      # happened.  Such a system could not be considered "sane".
      AC_MSG_ERROR([ls -t appears to fail.  Make sure there is not a broken
alias in your environment])
   fi

   test "[$]2" = conftestfile
   )
then
   # Ok.
   :
else
   AC_MSG_ERROR([newly created file is older than distributed files!
Check your system clock])
fi
rm -f conftest*
AC_MSG_RESULT(yes)])

dnl AM_MISSING_PROG(NAME, PROGRAM, DIRECTORY)
dnl The program must properly implement --version.
AC_DEFUN([AM_MISSING_PROG],
[AC_MSG_CHECKING(for working $2)
# Run test in a subshell; some versions of sh will print an error if
# an executable is not found, even if stderr is redirected.
# Redirect stdin to placate older versions of autoconf.  Sigh.
if ($2 --version) < /dev/null > /dev/null 2>&1; then
   $1=$2
   AC_MSG_RESULT(found)
else
   $1="$3/missing $2"
   AC_MSG_RESULT(missing)
fi
AC_SUBST($1)])

# Add --enable-maintainer-mode option to configure.
# From Jim Meyering

# serial 1

AC_DEFUN([AM_MAINTAINER_MODE],
[AC_MSG_CHECKING([whether to enable maintainer-specific portions of Makefiles])
  dnl maintainer-mode is disabled by default
  AC_ARG_ENABLE(maintainer-mode,
[  --enable-maintainer-mode enable make rules and dependencies not useful
                          (and sometimes confusing) to the casual installer],
      USE_MAINTAINER_MODE=$enableval,
      USE_MAINTAINER_MODE=no)
  AC_MSG_RESULT($USE_MAINTAINER_MODE)
  AM_CONDITIONAL(MAINTAINER_MODE, test $USE_MAINTAINER_MODE = yes)
  MAINT=$MAINTAINER_MODE_TRUE
  AC_SUBST(MAINT)dnl
]
)

# Define a conditional.

AC_DEFUN([AM_CONDITIONAL],
[AC_SUBST($1_TRUE)
AC_SUBST($1_FALSE)
if $2; then
  $1_TRUE=
  $1_FALSE='#'
else
  $1_TRUE='#'
  $1_FALSE=
fi])


dnl AC_PROG_INTLTOOL([MINIMUM-VERSION])
# serial 1 AC_PROG_INTLTOOL
AC_DEFUN(AC_PROG_INTLTOOL,
[

if test -n "$1"; then
    AC_MSG_CHECKING(for intltool >= $1)

    INTLTOOL_REQUIRED_VERSION_AS_INT=`echo $1 | awk -F. '{ printf "%d", $[1] * 100 + $[2]; }'`
    INTLTOOL_APPLIED_VERSION=`awk -F\" '/\\$VERSION / { printf $[2]; }'  < ${srcdir}/intltool-update.in`
    changequote({{,}})
    INTLTOOL_APPLIED_VERSION_AS_INT=`awk -F\" '/\\$VERSION / { split(${{2}}, VERSION, "."); printf "%d\n", VERSION[1] * 100 + VERSION[2];}' < ${srcdir}/intltool-update.in`
    changequote([,])

    if test "$INTLTOOL_APPLIED_VERSION_AS_INT" -ge "$INTLTOOL_REQUIRED_VERSION_AS_INT"; then
	AC_MSG_RESULT([$INTLTOOL_APPLIED_VERSION found])
    else
	AC_MSG_RESULT([$INTLTOOL_APPLIED_VERSION found. Your intltool is too old.  You need intltool $1 or later.])
	exit 1
    fi
fi

  INTLTOOL_DESKTOP_RULE='%.desktop:   %.desktop.in   $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; $(INTLTOOL_MERGE) $(top_srcdir)/po $< [$]@ -d -u -c $(top_builddir)/po/.intltool-merge-cache'
INTLTOOL_DIRECTORY_RULE='%.directory: %.directory.in $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; $(INTLTOOL_MERGE) $(top_srcdir)/po $< [$]@ -d -u -c $(top_builddir)/po/.intltool-merge-cache'
     INTLTOOL_KEYS_RULE='%.keys:      %.keys.in      $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; $(INTLTOOL_MERGE) $(top_srcdir)/po $< [$]@ -k -u -c $(top_builddir)/po/.intltool-merge-cache'
     INTLTOOL_PROP_RULE='%.prop:      %.prop.in      $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; $(INTLTOOL_MERGE) $(top_srcdir)/po $< [$]@ -d -u -c $(top_builddir)/po/.intltool-merge-cache'
      INTLTOOL_OAF_RULE='%.oaf:       %.oaf.in       $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; $(INTLTOOL_MERGE) $(top_srcdir)/po $< [$]@ -o -p'
     INTLTOOL_PONG_RULE='%.pong:      %.pong.in      $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; $(INTLTOOL_MERGE) $(top_srcdir)/po $< [$]@ -x -u -c $(top_builddir)/po/.intltool-merge-cache'
   INTLTOOL_SERVER_RULE='%.server:    %.server.in    $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; $(INTLTOOL_MERGE) $(top_srcdir)/po $< [$]@ -o -u -c $(top_builddir)/po/.intltool-merge-cache'
    INTLTOOL_SHEET_RULE='%.sheet:     %.sheet.in     $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; $(INTLTOOL_MERGE) $(top_srcdir)/po $< [$]@ -x -u -c $(top_builddir)/po/.intltool-merge-cache'
INTLTOOL_SOUNDLIST_RULE='%.soundlist: %.soundlist.in $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; $(INTLTOOL_MERGE) $(top_srcdir)/po $< [$]@ -d -u -c $(top_builddir)/po/.intltool-merge-cache'
       INTLTOOL_UI_RULE='%.ui:        %.ui.in        $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; $(INTLTOOL_MERGE) $(top_srcdir)/po $< [$]@ -x -u -c $(top_builddir)/po/.intltool-merge-cache'
      INTLTOOL_XML_RULE='%.xml:       %.xml.in       $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; $(INTLTOOL_MERGE) $(top_srcdir)/po $< [$]@ -x -u -c $(top_builddir)/po/.intltool-merge-cache'
    INTLTOOL_CAVES_RULE='%.caves:     %.caves.in     $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; $(INTLTOOL_MERGE) $(top_srcdir)/po $< [$]@ -d -u -c $(top_builddir)/po/.intltool-merge-cache'
  INTLTOOL_SCHEMAS_RULE='%.schemas:   %.schemas.in   $(INTLTOOL_MERGE) $(wildcard $(top_srcdir)/po/*.po) ; $(INTLTOOL_MERGE) $(top_srcdir)/po $< [$]@ -s -u -c $(top_builddir)/po/.intltool-merge-cache'

AC_SUBST(INTLTOOL_DESKTOP_RULE)
AC_SUBST(INTLTOOL_DIRECTORY_RULE)
AC_SUBST(INTLTOOL_KEYS_RULE)
AC_SUBST(INTLTOOL_PROP_RULE)
AC_SUBST(INTLTOOL_OAF_RULE)
AC_SUBST(INTLTOOL_PONG_RULE)
AC_SUBST(INTLTOOL_SERVER_RULE)
AC_SUBST(INTLTOOL_SHEET_RULE)
AC_SUBST(INTLTOOL_SOUNDLIST_RULE)
AC_SUBST(INTLTOOL_UI_RULE)
AC_SUBST(INTLTOOL_XML_RULE)
AC_SUBST(INTLTOOL_CAVES_RULE)
AC_SUBST(INTLTOOL_SCHEMAS_RULE)

# Use the tools built into the package, not the ones that are installed.

INTLTOOL_EXTRACT='$(top_builddir)/intltool-extract'
INTLTOOL_MERGE='$(top_builddir)/intltool-merge'
INTLTOOL_UPDATE='$(top_builddir)/intltool-update'

AC_SUBST(INTLTOOL_EXTRACT)
AC_SUBST(INTLTOOL_MERGE)
AC_SUBST(INTLTOOL_UPDATE)

AC_PATH_PROG(INTLTOOL_PERL, perl)
if test -z "$INTLTOOL_PERL"; then
   AC_MSG_ERROR([perl not found; required for intltool])
fi
if test -z "`$INTLTOOL_PERL -v | fgrep '5.' 2> /dev/null`"; then
   AC_MSG_ERROR([perl 5.x required for intltool])
fi

# Remove file type tags (using []) from po/POTFILES.

ifdef([AC_DIVERSION_ICMDS],[
  AC_DIVERT_PUSH(AC_DIVERSION_ICMDS)
      changequote(,)
      mv -f po/POTFILES po/POTFILES.tmp
      sed -e 's/\[.*\] *//' < po/POTFILES.tmp > po/POTFILES
      rm -f po/POTFILES.tmp
      changequote([,])
  AC_DIVERT_POP()
],[
  ifdef([AC_CONFIG_COMMANDS_PRE],[
    AC_CONFIG_COMMANDS_PRE([
        changequote(,)
        mv -f po/POTFILES po/POTFILES.tmp
        sed -e 's/\[.*\] *//' < po/POTFILES.tmp > po/POTFILES
        rm -f po/POTFILES.tmp
        changequote([,])
    ])
  ])
])

# Manually sed perl in so people don't have to put the intltool scripts in AC_OUTPUT.

AC_OUTPUT_COMMANDS([

sed -e "s:@INTLTOOL_PERL@:${INTLTOOL_PERL}:;" < ${srcdir}/intltool-extract.in > intltool-extract.out
if cmp -s intltool-extract intltool-extract.out 2>/dev/null; then
  rm -f intltool-extract.out
else
  mv -f intltool-extract.out intltool-extract
fi
chmod ugo+x intltool-extract
chmod u+w intltool-extract

sed -e "s:@INTLTOOL_PERL@:${INTLTOOL_PERL}:;" < ${srcdir}/intltool-merge.in > intltool-merge.out
if cmp -s intltool-merge intltool-merge.out 2>/dev/null; then
  rm -f intltool-merge.out
else
  mv -f intltool-merge.out intltool-merge
fi
chmod ugo+x intltool-merge
chmod u+w intltool-merge

sed -e "s:@INTLTOOL_PERL@:${INTLTOOL_PERL}:;" < ${srcdir}/intltool-update.in > intltool-update.out
if cmp -s intltool-update intltool-update.out 2>/dev/null; then
  rm -f intltool-update.out
else
  mv -f intltool-update.out intltool-update
fi
chmod ugo+x intltool-update
chmod u+w intltool-update

], INTLTOOL_PERL=${INTLTOOL_PERL})

])

# Macro to add for using GNU gettext.
# Ulrich Drepper <drepper@cygnus.com>, 1995, 1996
#
# Modified to never use included libintl. 
# Owen Taylor <otaylor@redhat.com>, 12/15/1998
#
#
# This file can be copied and used freely without restrictions.  It can
# be used in projects which are not available under the GNU Public License
# but which still want to provide support for the GNU gettext functionality.
# Please note that the actual code is *not* freely available.
#
#
# If you make changes to this file, you MUST update the copy in
# acinclude.m4. [ aclocal dies on duplicate macros, so if
# we run 'aclocal -I macros/' then we'll run into problems
# once we've installed glib-gettext.m4 :-( ]
#

AC_DEFUN([AM_GLIB_LC_MESSAGES],
  [if test $ac_cv_header_locale_h = yes; then
    AC_CACHE_CHECK([for LC_MESSAGES], am_cv_val_LC_MESSAGES,
      [AC_TRY_LINK([#include <locale.h>], [return LC_MESSAGES],
       am_cv_val_LC_MESSAGES=yes, am_cv_val_LC_MESSAGES=no)])
    if test $am_cv_val_LC_MESSAGES = yes; then
      AC_DEFINE(HAVE_LC_MESSAGES, 1,
        [Define if your <locale.h> file defines LC_MESSAGES.])
    fi
  fi])

dnl AM_GLIB_PATH_PROG_WITH_TEST(VARIABLE, PROG-TO-CHECK-FOR,
dnl   TEST-PERFORMED-ON-FOUND_PROGRAM [, VALUE-IF-NOT-FOUND [, PATH]])
AC_DEFUN([AM_GLIB_PATH_PROG_WITH_TEST],
[# Extract the first word of "$2", so it can be a program name with args.
set dummy $2; ac_word=[$]2
AC_MSG_CHECKING([for $ac_word])
AC_CACHE_VAL(ac_cv_path_$1,
[case "[$]$1" in
  /*)
  ac_cv_path_$1="[$]$1" # Let the user override the test with a path.
  ;;
  *)
  IFS="${IFS= 	}"; ac_save_ifs="$IFS"; IFS="${IFS}:"
  for ac_dir in ifelse([$5], , $PATH, [$5]); do
    test -z "$ac_dir" && ac_dir=.
    if test -f $ac_dir/$ac_word; then
      if [$3]; then
	ac_cv_path_$1="$ac_dir/$ac_word"
	break
      fi
    fi
  done
  IFS="$ac_save_ifs"
dnl If no 4th arg is given, leave the cache variable unset,
dnl so AC_PATH_PROGS will keep looking.
ifelse([$4], , , [  test -z "[$]ac_cv_path_$1" && ac_cv_path_$1="$4"
])dnl
  ;;
esac])dnl
$1="$ac_cv_path_$1"
if test ifelse([$4], , [-n "[$]$1"], ["[$]$1" != "$4"]); then
  AC_MSG_RESULT([$]$1)
else
  AC_MSG_RESULT(no)
fi
AC_SUBST($1)dnl
])

# serial 5

AC_DEFUN(AM_GLIB_WITH_NLS,
  dnl NLS is obligatory
  [USE_NLS=yes
    AC_SUBST(USE_NLS)

    dnl Figure out what method
    nls_cv_force_use_gnu_gettext="no"

    nls_cv_use_gnu_gettext="$nls_cv_force_use_gnu_gettext"
    if test "$nls_cv_force_use_gnu_gettext" != "yes"; then
      dnl User does not insist on using GNU NLS library.  Figure out what
      dnl to use.  If gettext or catgets are available (in this order) we
      dnl use this.  Else we have to fall back to GNU NLS library.
      dnl catgets is only used if permitted by option --with-catgets.
      nls_cv_header_intl=
      nls_cv_header_libgt=
      CATOBJEXT=NONE
      XGETTEXT=:

      AC_CHECK_HEADER(libintl.h,
        [AC_CACHE_CHECK([for dgettext in libc], gt_cv_func_dgettext_libc,
	  [AC_TRY_LINK([#include <libintl.h>], [return (int) dgettext ("","")],
	    gt_cv_func_dgettext_libc=yes, gt_cv_func_dgettext_libc=no)])

          gt_cv_func_dgettext_libintl="no"
          libintl_extra_libs=""

	  if test "$gt_cv_func_dgettext_libc" != "yes" ; then
	    AC_CHECK_LIB(intl, bindtextdomain,
              [AC_CHECK_LIB(intl, dgettext,
                            gt_cv_func_dgettext_libintl=yes)])

	    if test "$gt_cv_func_dgettext_libc" != "yes" ; then
              AC_MSG_CHECKING([if -liconv is needed to use gettext])
              AC_MSG_RESULT([])
              AC_CHECK_LIB(intl, dcgettext,
                           [gt_cv_func_dgettext_libintl=yes
                            libintl_extra_libs=-liconv],
                           :,-liconv)
            fi
          fi

          if test "$gt_cv_func_dgettext_libintl" = "yes"; then
	    LIBS="$LIBS -lintl $libintl_extra_libs";
          fi

	  if test "$gt_cv_func_dgettext_libc" = "yes" \
	    || test "$gt_cv_func_dgettext_libintl" = "yes"; then
	    AC_DEFINE(HAVE_GETTEXT,1,
              [Define if the GNU gettext() function is already present or preinstalled.])
	    AM_GLIB_PATH_PROG_WITH_TEST(MSGFMT, msgfmt,
 	      [test -z "`$ac_dir/$ac_word -h 2>&1 | grep 'dv '`"], no)dnl
	    if test "$MSGFMT" != "no"; then
	      AC_CHECK_FUNCS(dcgettext)
	      AC_PATH_PROG(GMSGFMT, gmsgfmt, $MSGFMT)
	      AM_GLIB_PATH_PROG_WITH_TEST(XGETTEXT, xgettext,
	        [test -z "`$ac_dir/$ac_word -h 2>&1 | grep '(HELP)'`"], :)
	      AC_TRY_LINK(, [extern int _nl_msg_cat_cntr;
		 	     return _nl_msg_cat_cntr],
	        [CATOBJEXT=.gmo
	         DATADIRNAME=share],
	        [CATOBJEXT=.mo
	         DATADIRNAME=lib])
	      INSTOBJEXT=.mo
	    fi
	  fi

	  # Added by Martin Baulig 12/15/98 for libc5 systems
	  if test "$gt_cv_func_dgettext_libc" != "yes" \
	    && test "$gt_cv_func_dgettext_libintl" = "yes"; then
	    INTLLIBS="-lintl $libintl_extra_libs"
	    LIBS=`echo $LIBS | sed -e 's/-lintl//'`
	  fi
      ])

      if test "$CATOBJEXT" = "NONE"; then
        dnl Neither gettext nor catgets in included in the C library.
        dnl Fall back on GNU gettext library.
        nls_cv_use_gnu_gettext=yes
      fi
    fi

    if test "$nls_cv_use_gnu_gettext" != "yes"; then
      AC_DEFINE(ENABLE_NLS, 1,
        [always defined to indicate that i18n is enabled])
    else
      dnl Unset this variable since we use the non-zero value as a flag.
      CATOBJEXT=
    fi

    dnl Test whether we really found GNU xgettext.
    if test "$XGETTEXT" != ":"; then
      dnl If it is no GNU xgettext we define it as : so that the
      dnl Makefiles still can work.
      if $XGETTEXT --omit-header /dev/null 2> /dev/null; then
        : ;
      else
        AC_MSG_RESULT(
	  [found xgettext program is not GNU xgettext; ignore it])
        XGETTEXT=":"
      fi
    fi

    # We need to process the po/ directory.
    POSUB=po

    AC_OUTPUT_COMMANDS(
      [case "$CONFIG_FILES" in *po/Makefile.in*)
        sed -e "/POTFILES =/r po/POTFILES" po/Makefile.in > po/Makefile
      esac])

    dnl These rules are solely for the distribution goal.  While doing this
    dnl we only have to keep exactly one list of the available catalogs
    dnl in configure.in.
    for lang in $ALL_LINGUAS; do
      GMOFILES="$GMOFILES $lang.gmo"
      POFILES="$POFILES $lang.po"
    done

    dnl Make all variables we use known to autoconf.
    AC_SUBST(CATALOGS)
    AC_SUBST(CATOBJEXT)
    AC_SUBST(DATADIRNAME)
    AC_SUBST(GMOFILES)
    AC_SUBST(INSTOBJEXT)
    AC_SUBST(INTLDEPS)
    AC_SUBST(INTLLIBS)
    AC_SUBST(INTLOBJS)
    AC_SUBST(POFILES)
    AC_SUBST(POSUB)
  ])

AC_DEFUN(AM_GLIB_GNU_GETTEXT,
  [AC_REQUIRE([AC_PROG_MAKE_SET])dnl
   AC_REQUIRE([AC_PROG_CC])dnl
   AC_REQUIRE([AC_PROG_RANLIB])dnl
   AC_REQUIRE([AC_HEADER_STDC])dnl
   AC_REQUIRE([AC_C_CONST])dnl
   AC_REQUIRE([AC_C_INLINE])dnl
   AC_REQUIRE([AC_TYPE_OFF_T])dnl
   AC_REQUIRE([AC_TYPE_SIZE_T])dnl
   AC_REQUIRE([AC_FUNC_ALLOCA])dnl
   AC_REQUIRE([AC_FUNC_MMAP])dnl

   AC_CHECK_HEADERS([argz.h limits.h locale.h nl_types.h malloc.h string.h \
unistd.h sys/param.h])
   AC_CHECK_FUNCS([getcwd munmap putenv setenv setlocale strchr strcasecmp \
strdup __argz_count __argz_stringify __argz_next])

   AM_GLIB_LC_MESSAGES
   AM_GLIB_WITH_NLS

   if test "x$CATOBJEXT" != "x"; then
     if test "x$ALL_LINGUAS" = "x"; then
       LINGUAS=
     else
       AC_MSG_CHECKING(for catalogs to be installed)
       NEW_LINGUAS=
       for lang in ${LINGUAS=$ALL_LINGUAS}; do
         case "$ALL_LINGUAS" in
          *$lang*) NEW_LINGUAS="$NEW_LINGUAS $lang" ;;
         esac
       done
       LINGUAS=$NEW_LINGUAS
       AC_MSG_RESULT($LINGUAS)
     fi

     dnl Construct list of names of catalog files to be constructed.
     if test -n "$LINGUAS"; then
       for lang in $LINGUAS; do CATALOGS="$CATALOGS $lang$CATOBJEXT"; done
     fi
   fi

   dnl Determine which catalog format we have (if any is needed)
   dnl For now we know about two different formats:
   dnl   Linux libc-5 and the normal X/Open format
   test -d po || mkdir po
   if test "$CATOBJEXT" = ".cat"; then
     AC_CHECK_HEADER(linux/version.h, msgformat=linux, msgformat=xopen)

     dnl Transform the SED scripts while copying because some dumb SEDs
     dnl cannot handle comments.
     sed -e '/^#/d' $srcdir/po/$msgformat-msg.sed > po/po2msg.sed
   fi

   dnl If the AC_CONFIG_AUX_DIR macro for autoconf is used we possibly
   dnl find the mkinstalldirs script in another subdir but ($top_srcdir).
   dnl Try to locate is.
   MKINSTALLDIRS=
   if test -n "$ac_aux_dir"; then
     MKINSTALLDIRS="$ac_aux_dir/mkinstalldirs"
   fi
   if test -z "$MKINSTALLDIRS"; then
     MKINSTALLDIRS="\$(top_srcdir)/mkinstalldirs"
   fi
   AC_SUBST(MKINSTALLDIRS)

   dnl Generate list of files to be processed by xgettext which will
   dnl be included in po/Makefile.
   test -d po || mkdir po
   if test "x$srcdir" != "x."; then
     if test "x`echo $srcdir | sed 's@/.*@@'`" = "x"; then
       posrcprefix="$srcdir/"
     else
       posrcprefix="../$srcdir/"
     fi
   else
     posrcprefix="../"
   fi
   rm -f po/POTFILES
   sed -e "/^#/d" -e "/^\$/d" -e "s,.*,	$posrcprefix& \\\\," -e "\$s/\(.*\) \\\\/\1/" \
	< $srcdir/po/POTFILES.in > po/POTFILES
  ])


