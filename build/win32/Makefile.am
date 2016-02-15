GENERATED_ITEMS = copy-actual.bat

EXTRA_DIST =	\
	adwaita-msvc.mak	\
	apply_dirs.py		\
	detectenv-msvc.mak	\
	README.txt		\
	replace.py		\
	$(GENERATED_ITEMS)

# Windows does not support UNIX-style symlinks, so we need to
# find out what files are really symlinks, and copy the real files
# that those symlinks point to, to replace those symlink files
# during installation, in a batch script.  Also, as file decompressing
# utilities might mix up symlinks with their targets, we need to work
# around that by checking the file size in the batch and copy the other
# way round if needed.

symlinks_cmd := $(shell find $(top_srcdir)/Adwaita -type l)
tree_top := ../..
msvc_installpfx := %PREFIX%/share/icons
copy_cmd := copy^/b^

# I know that this command line is really messy, but any suggestions to
# break this into more readable parts is really appreciated!
realfile = $(foreach L,$(symlinks_cmd),for^%%F^in^\($(subst /,\\,$(addprefix $(subst $(top_srcdir),$(tree_top),$(dir $(L))),$(shell readlink $(L))))\)^do^if^not^\"%%~zF\"^==^\"0\"^\($(copy_cmd)$(subst /,\\,%%F^$(subst $(top_srcdir),$(msvc_installpfx),$(L))\))^else^\($(copy_cmd)$(subst /,\\,$(subst $(top_srcdir),$(tree_top),$(L))^$(subst $(top_srcdir),$(msvc_installpfx),$(dir $(L))))%%~nxF\))

copy-actual.bat:
	@echo 'set PREFIX=%1' > $@
	@for l in $(realfile); do echo $$l | sed -e 's/\^/ /g' >>$@; done

DISTCLEANFILES = $(GENERATED_ITEMS)
