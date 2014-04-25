#! /bin/bash

if [ "x$1" = "x" ]
then
  echo "Usage: $0 [icon theme directory]"
  exit 1
fi

THEME_NAME=`echo "$1" | sed -e 's,/$,,'`
THEME_COMMENT="$THEME_NAME Icon Theme"

OUTPUT=$(echo "output/$1" | sed 's/ //')
OUTPUT=`pwd`/$OUTPUT

rm -rf "$OUTPUT"

mkdir -p "$OUTPUT"

CWD=`pwd`
cd "$1"
cp -r * $OUTPUT
cd $CWD


echo "Creating icon theme in '$OUTPUT'"

echo "Copying build files.."

cp build/* "$OUTPUT"

cd "$OUTPUT"

echo "Creating index.theme"

echo -e "[Icon Theme]\nName=$THEME_NAME\nComment=$THEME_COMMENT\n" > index.theme
echo -n "Directories=" >> index.theme

DIRS=`find * -type d | grep -v git | grep -v scalable | grep "/" | sort -r`

for foo in $DIRS
do
	echo -n "$foo," >> index.theme
done

for foo in $DIRS
do
  size=`echo $foo | sed 's/\x.*//'`
  type="Scalable"
  maxsize="MaxSize=512"
  echo -en "\n\n[$foo]\nSize=$size\nContext=`basename $foo`\nType=$type\n$maxsize" >> index.theme
done


echo "Creating Makefiles"

SIZES=$(find * -maxdepth 0 -type d -not -name 'scalable' -printf '%f ')

MAKEFILES='Makefile\n'
for dir in $SIZES
do
  subdirs=$(find $dir/* -maxdepth 0 -type d -printf '%f ')
  echo "SUBDIRS=$subdirs" > $dir/Makefile.am
  MAKEFILES="$MAKEFILES\n$dir/Makefile"
              for context in $subdirs
              do

                      MAKEFILES="$MAKEFILES\n$dir/$context/Makefile"
                      files=`echo $dir/$context/*.{svg,icon,png}|sed "s/$dir\/$context\///g"| sed 's/\*\.\(icon\|png\|svg\)//g'`
                      echo "themedir = \$(datadir)/icons/$THEME_NAME/$dir/$context" > $dir/$context/Makefile.am
                      echo "theme_DATA = $files" >> $dir/$context/Makefile.am
                      echo "EXTRA_DIST = \$(theme_DATA)" >> $dir/$context/Makefile.am
                      echo "install-data-local: install-themeDATA"  >> $dir/$context/Makefile.am
                      echo "	(cd \"\$(DESTDIR)\$(themedir)\" && \$(ICONMAP) -c $context )" >> $dir/$context/Makefile.am
                      echo "MAINTAINERCLEANFILES = Makefile.in" >> $dir/$context/Makefile.am
              done
done

echo "Updating configure.ac"
M=`echo "$MAKEFILES" | sed 's/\//\\\\\//g'`
sed -i -e "s/MAKEFILES/$M/" configure.ac

echo "Updating Makefile.am"
sed -i -e "s/REAL_SUB_DIRS/$SIZES/" Makefile.am
sed -i -e "s/THEME_NAME/$THEME_NAME/" Makefile.am

echo "Done"
