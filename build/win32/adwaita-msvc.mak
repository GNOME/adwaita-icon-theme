# NMake Makefile to generate the
# complete index.theme file and to
# install the icons

!include detectenv-msvc.mak

!IF "$(SRCROOTDIR)" == ""
SRCROOTDIR=..\..
!ENDIF

# Python.exe either needs to be in your PATH or you need to pass
# in PYTHON=<full-path-to-your-Python-executable> for this to work.
# Either Python 2.7 or 3.x can be used

!IF "$(PYTHON)" == ""
PYTHON=python
!ENDIF

# Prefix of your installation.  Pass in PREFIX=<your-installation-prefix>
# if needed.  gtk-update-icon-cache need to be found
# in $(PREFIX)\bin
!IF "$(PREFIX)" == ""
PREFIX=$(SRCROOTDIR)\..\vs$(VSVER)\$(PLAT)
!ENDIF

ERRNUL  = 2>NUL
_HASH=^#
NULL=
ICON_SUBDIR=share\icons\Adwaita
GDK_PIXBUF_MOD_VERSION=2.10.0

# Generate the NMake Makefile modules for the listing of subdirs for each icon size
!if [@for /f %s in ('dir /b /on $(SRCROOTDIR)\Adwaita') do @if not "%s" == "cursors" (@echo SIZE_%s_dirs = \> %s.mak) & (@for /f %d in ('dir /b $(SRCROOTDIR)\Adwaita\%s') do @echo %s/%d \>> %s.mak) & @echo ^$(NULL) >> %s.mak]
!endif

# We want underscores instead of dashes in the Makefile varnames
!if [ren scalable-up-to-32.mak scalable-up-to-32.mak.tmp]
!endif
!if [$(PYTHON) replace.py --action=replace-str -i=scalable-up-to-32.mak.tmp -o=scalable-up-to-32.mak --instring=SIZE_scalable-up-to-32_dirs --outstring=SIZE_scalable_up_to_32_dirs]
!endif
!if [del scalable-up-to-32.mak.tmp]
!endif

# Include the generated NMake Makefile modules to have the full listing of directories, and then get rid of them...
!include 8x8.mak
!include 16x16.mak
!include 22x22.mak
!include 24x24.mak
!include 32x32.mak
!include 48x48.mak
!include 64x64.mak
!include 96x96.mak
!include 256x256.mak
!include scalable.mak
!include scalable-up-to-32.mak

!if [@for /f %s in ('dir /b /on $(SRCROOTDIR)\Adwaita') do @if not "%s" == "cursors" del %s.mak]
!endif

FIXED_ICON_DIRS = \
	$(SIZE_8x8_dirs)	\
	$(SIZE_16x16_dirs)	\
	$(SIZE_22x22_dirs)	\
	$(SIZE_24x24_dirs)	\
	$(SIZE_32x32_dirs)	\
	$(SIZE_48x48_dirs)	\
	$(SIZE_64x64_dirs)	\
	$(SIZE_96x96_dirs)

CONTEXT_PYTHON_CMD = $(PYTHON) -c "print('Context=' + '%d'['%d'.rfind('/') + 1:].title())"
SIZE_256 = 256
SIZE_256_MIN = 56
SIZE_SCALABLE = 16
SIZE_SCALABLE_32_MIN = 16
SIZE_SCALABLE_32_MAX = 32
SIZE_SCALABLE_MIN = 8
SIZE_SCALABLE_MAX = 512

all: index.theme

index.theme: index.theme.tmp
#	From index.theme.tmp, append then to the file the info for each subdir
#	under each icon size
#
#	The fixed-sized icons...
	@for %d in ($(FIXED_ICON_DIRS))	do		\
	@(echo [%d])>>$@.tmp &					\
	@($(CONTEXT_PYTHON_CMD))>>$@.tmp &		\
	@($(PYTHON) -c "print('Size=' + '%d'[:'%d'.find('x')])")>>$@.tmp &	\
	@(echo Type=Fixed)>>$@.tmp &	\
	@(echo.)>>$@.tmp

#	The 256x256 icons...
	@for %d in ($(SIZE_256x256_dirs))	do		\
	@(echo [%d]>>$@.tmp) &						\
	@($(CONTEXT_PYTHON_CMD))>>$@.tmp &			\
	@(echo Size=$(SIZE_256))>>$@.tmp &			\
	@(echo MinSize=$(SIZE_256_MIN))>>$@.tmp &	\
	@(echo MaxSize=$(SIZE_SCALABLE_MAX))>>$@.tmp &	\
	@(echo Type=Scalable)>>$@.tmp &			\
	@(echo.)>>$@.tmp

#	The scalable icons...
	@for %d in ($(SIZE_scalable_dirs))	do		\
	@(echo [%d]>>$@.tmp) &						\
	@($(CONTEXT_PYTHON_CMD))>>$@.tmp &			\
	@(echo Size=$(SIZE_SCALABLE))>>$@.tmp &	\
	@(echo MinSize=$(SIZE_SCALABLE_MIN))>>$@.tmp &	\
	@(echo MaxSize=$(SIZE_SCALABLE_MAX))>>$@.tmp &	\
	@(echo Type=Scalable)>>$@.tmp &			\
	@(echo.)>>$@.tmp

#	The scalable-up-to-32 icons...
	@for %d in ($(SIZE_scalable_up_to_32_dirs))	do	\
	@(echo [%d]>>$@.tmp) &						\
	@($(CONTEXT_PYTHON_CMD))>>$@.tmp &			\
	@(echo Size=$(SIZE_SCALABLE))>>$@.tmp &	\
	@(echo MinSize=$(SIZE_SCALABLE_32_MIN))>>$@.tmp &	\
	@(echo MaxSize=$(SIZE_SCALABLE_32_MAX))>>$@.tmp &	\
	@(echo Type=Scalable)>>$@.tmp &			\
	@(echo.)>>$@.tmp

	@$(PYTHON) replace.py -i=$@.tmp -o=$@.tmp1 --action=replace-str --instring=App --outstring=Application
	@$(PYTHON) replace.py -i=$@.tmp1 -o=$@ --action=replace-str --instring=Mimetype --outstring=MimeType
	@del $@.tmp1

index.theme.tmp: $(SRCROOTDIR)\index.theme.in dir_list.py
#	First generate a temporary index.theme.tmp that has @THEME_DIRS@ replaced appropriately
	@echo Generating index.theme...
	@$(PYTHON) apply_dirs.py -i=$(SRCROOTDIR)\$(@B).in -o=$@

dir_list.py:
#	Generate a Python list of subdirs under Adwaita/ for the icons
	@echo icon_dirs = [>$@
	@for %d in ($(FIXED_ICON_DIRS) $(SIZE_256x256_dirs) $(SIZE_scalable_dirs) $(SIZE_scalable_up_to_32_dirs)) do @echo '%d',>>$@
	@echo ]>>$@

.SUFFIXES: .svg .png

# Copy the icon and cursor files, and convert the SVG symbolic icons if:
# -The gtk-encode-symbolic-svg tool is found in $(PREFIX)\bin -AND-
# -The SVG GDK-Pixbuf loader can be found in $(PREFIX)\lib\gdk-pixbuf-2.0\2.10.0\loaders
install: index.theme
	@-mkdir $(PREFIX)\$(ICON_SUBDIR)
	copy index.theme $(PREFIX)\$(ICON_SUBDIR)
	for /f %d in ('dir /b $(SRCROOTDIR)\Adwaita') do								\
	@(echo Copying files for %d...) & 										\
	@(mkdir $(PREFIX)\$(ICON_SUBDIR)\%d) & 										\
	@(if not "%d" == "cursors"											\
		(for /f %f in ('dir /b /on $(SRCROOTDIR)\Adwaita\%d') do						\
		 (mkdir $(PREFIX)\$(ICON_SUBDIR)\%d\%f) &								\
		 (copy /b $(SRCROOTDIR)\Adwaita\%d\%f\* $(PREFIX)\$(ICON_SUBDIR)\%d\%f))				\
	  else (copy /b $(SRCROOTDIR)\Adwaita\%d\* $(PREFIX)\$(ICON_SUBDIR)\%d))
	call copy-actual.bat $(PREFIX)
	@if exist $(PREFIX)\bin\gtk-encode-symbolic-svg.exe								\
	if exist $(PREFIX)\lib\gdk-pixbuf-2.0\$(GDK_PIXBUF_MOD_VERSION)\loaders\libpixbufloader-svg.dll			\
	if exist $(PREFIX)\lib\gdk-pixbuf-2.0\$(GDK_PIXBUF_MOD_VERSION)\loaders.cache 					\
		@(echo Converting symbolic SVG icons to PNG...) &							\
		@(for %z in (16x16 24x24 32x32 48x48 64x64 96x96) do							\
			@(echo Converting symbolic SVG icons to %z PNG...) &						\
			@(for /f %d in ('dir /b /on $(SRCROOTDIR)\Adwaita\scalable') do					\
				@(for /f %f in ('dir /b /on $(SRCROOTDIR)\Adwaita\scalable\%d') do			\
					@($(PREFIX)\bin\gtk-encode-symbolic-svg $(SRCROOTDIR)\Adwaita\scalable\%d\%f	\
					 %z -o $(PREFIX)\$(ICON_SUBDIR)\%z\%d))))
	@if exist $(PREFIX)\bin\gtk-update-icon-cache.exe 								\
	@(echo Update icon cache...) &											\
	@($(PREFIX)\bin\gtk-update-icon-cache -q $(PREFIX)\$(ICON_SUBDIR))
	@echo Adwaita icon theme install complete.

clean:
	@-del index.theme
	@-del index.theme.tmp
	@-del dir_list.py
	@-for %a in (*.pyc) do @del *.pyc
	@-if exist __pycache__ rmdir /s /q __pycache__
