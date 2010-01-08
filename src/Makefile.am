
icon_in_files = $(shell SRCDIR="$(srcdir)"; for i in `find $$SRCDIR -name "*.svg"`; do printf "$$i "; done)
icon_files = $(shell for i in `find $(top_builddir)/$(SVGOUTDIR) -name "*.png"`; do printf "$$i"; done)

if ALLOW_RENDERING
render-png: $(icon_in_files) Makefile
	for file in $(icon_in_files); do \
		for size in $(render_sizes); do \
			$(ICONTOOL_RENDER) -s $$size -o $(top_builddir)/$(SVGOUTDIR) $$file >/dev/null; \
		done; \
	done

else
render-png: $(icon_in_files) Makefile
	if "x$(top_srcdir)" != "x$(top_builddir)"; then \
		cp -a $(top_srcdir)/$(SVGOUTDIR) $(top_builddir)/$(SVGOUTDIR); \
	fi

endif

$(render_sizes): Makefile

render: render-png

install-data-local:
	for size in $(render_sizes); do \
		for dir in `if [ -d $(top_srcdir)/$(SVGOUTDIR)/$$size ]; then find $(top_srcdir)/$(SVGOUTDIR)/$$size/* -type d; fi`; do \
			for file in $(icon_files); do \
				context="`dirname $$file`"; \
				$(mkdir_p) $(DESTDIR)$(themedir)/$$size/$$context; \
				$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file; \
			done; \
		done; \
	done

uninstall-local:
	for size in $(render_sizes); do \
		for dir in `if [ -d $(top_srcdir)/$(SVGOUTDIR)/$$size ]; then find $(top_srcdir)/$(SVGOUTDIR)/$$size/* -type d; fi`; do \
			for file in $(icon_files); do \
				rm -f $(DESTDIR)$(themedir)/$$size/$$file; \
			done; \
		done; \
	done

EXTRA_DIST =			\
	$(icon_in_files)


MAINTAINERCLEANFILES =		\
	Makefile.in		\
	$(icon_cache)
