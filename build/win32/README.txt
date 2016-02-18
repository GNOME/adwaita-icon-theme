Please refer to the following GNOME Live! page for more detailed
instructions on building this package with Visual C++:

https://live.gnome.org/GTK%2B/Win32/MSVCCompilationOfGTKStack

The adwaita-msvc.mak is an NMake Makefile that is meant to be used to generate
the index.theme file that is needed for installation of this icon theme
package, as well as copying and processing the icon files so that they
will be ready for use for GTK+ applications.

The required dependencies are as follows:

-A working installation of Python 2.7.x+ or 3.x, which could be built from the
 sources or obtained from the installers from http://www.python.org.

For optimal results, you will also need:
-The gtk-update-icon-cache tool, which can be found by building the latest GTK+
 2.24+/3.18+ package.  If Visual Studio projects were not provided to build it,
 one can still build it manually after building GTK+ itself by running in
 $(GTK_srcroot)\gtk, $(PREFIX) is the prefix where the other parts of the GTK+
 stack reside:
 'cl /MD /O2 /W3 /GL /FImsvc_recommended_pragmas.h /I.. /I$(PREFIX)\include\gdk-pixbuf-2.0 /I$(PREFIX)\include\glib-2.0 /I$(PREFIX)\lib\glib-2.0\include /I$(PREFIX)\include updateiconcache.c /link /libpath:$(PREFIX)\lib gdk_pixbuf-2.0.lib gio-2.0.lib gobject-2.0.lib glib-2.0.lib intl.lib /DEBUG /out:gtk-update-icon-cache.exe /LTCG /opt:ref'
 (Embed the generated .exe.manifest or copy it if on Visual Studio 2008 using
  mt.exe)
 The tool should be placed in $(PREFIX)\bin.

-PNG versions of the SVG symbolic icons are generated in 16x16, 24x24, 32x32,
 48x48, 64x64 and 96x96 sizes if the gtk-encode-symbolic-svg tool is found in
 $(PREFIX)\bin, and the SVG GDK-Pixbuf loader is properly installed, which is
 obtained by building GDK-Pixbuf and libRSVG.  The PNG versions of the symbolic
 icons are necessary if your app is a GTK-3.x app and you are not intending to
 ship the SVG GDK-Pixbuf loader nor the libRSVG DLL (which are both required
 otherwise).

Run 'nmake /f adwaita-msvc.mak' to generate the needed index.theme file.
PYTHON=xxx can be specified on the command line if your Python interpretor is
not in your PATH.  Run 'nmake /f adwaita-msvc.mak install' to copy the
generated index.theme, as well as all the icon and cursor files into
$(PREFIX)\share\icons, and process them if the optional tools are found, so
that the icons will be ready for use by GTK+-using applications.
A 'clean' target is provided to remove all the generated files-to uninstall
the installed icons, simply delete the $(PREFIX)\share\icons\Adwaita folder.

Please refer to the README.txt file in $(GLib_src_root)\build\win32\vs<Visual Studio Version>
on how to build GLib using your version of Visual Studio.  Versions 2008 through 2015 are
currently supported.

Set up the source tree as follows under some arbitrary top
folder <root>:

<root>\<this-adwaita-icon-theme-source-tree>
<root>\<Visual Studio Version>\<PlatformName>

*this* file you are now reading is thus located at
<root>\<this-adwaita-icon-theme-source-tree>\build\README.txt

--Chun-wei Fan <fanc999@gmail.com>
