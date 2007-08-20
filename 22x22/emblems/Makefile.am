NULL=

size = 22x22
context = emblems
iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	emblem-default.png		\
	emblem-documents.png		\
	emblem-downloads.png		\
	emblem-favorite.png		\
	emblem-generic.png	\
	emblem-important.png		\
	emblem-mail.png	\
	emblem-new.png			\
	emblem-package.png		\
	emblem-photos.png		\
	emblem-readonly.png		\
	emblem-shared.png	\
	emblem-symbolic-link.png	\
	emblem-system.png		\
	emblem-unreadable.png		\
	emblem-urgent.png	\
	emblem-web.png
	$(NULL)

EXTRA_DIST = $(icons_DATA)

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
