NULL=

size = 8x8
context = emblems
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	emblem-default.png		\
	emblem-new.png			\
	emblem-readonly.png		\
	emblem-symbolic-link.png	\
	emblem-unreadable.png		\
	$(NULL)

EXTRA_DIST = $(icons_DATA)

MAINTAINERCLEANFILES =			\
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
