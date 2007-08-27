
size = 32x32
context = places

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =			\
	folder.icon		\
	folder.png		\
	folder-remote.png	\
	folder-saved-search.png	\
	network-server.png	\
	network-workgroup.png	\
	start-here.png		\
	user-desktop.png	\
	user-home.png		\
	user-trash.png

EXTRA_DIST =		\
	$(icons_DATA)

MAINTAINERCLEANFILES =	\
	Makefile.in

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

check:
	if test -r CVS/Entries; then \
		for icon in *.png; do \
			if grep $$icon CVS/Entries > /dev/null; then \
				if ! grep $$icon Makefile > /dev/null; then \
					echo "Missing $$icon in Makefile.am"; \
					exit 1; \
				fi; \
			fi; \
		done; \
	else \
		for icon in *.png; do \
			if ! grep $$icon Makefile > /dev/null; then \
				echo "Missing $$icon in Makefile.am"; \
				exit 1; \
			fi; \
		done; \
	fi
