
icon_in_files = $(shell SRCDIR="$(srcdir)"; for i in `find $$SRCDIR -name "*.svg"`; do printf "$$i "; done)

# Create placeholder files for folders that will get symbolic pre-rendered file so they are picked up for themes
render-placeholders:
	for file in `cd $(top_srcdir)/$(SVGOUTDIR)/scalable; find . -name "*.svg"`; do \
		context="`dirname $$file`"; \
		for size in $(symbolic_encode_sizes); do \
			$(mkdir_p) $(top_builddir)/$(SVGOUTDIR)/$$size/$$context; \
			touch $(top_builddir)/$(SVGOUTDIR)/$$size/$$context/.placeholder; \
		done \
	done

if ALLOW_RENDERING
render-png: $(icon_in_files) Makefile render-placeholders
	for file in $(icon_in_files); do \
		for size in $(symbolic_render_sizes); do \
			$(ICONTOOL_RENDER) -s $$size -o $(top_builddir)/$(SVGOUTDIR) $$file >/dev/null; \
		done; \
	done
else
render-png: $(icon_in_files) Makefile render-placeholders

endif

$(symbolic_render_sizes): Makefile

render: render-png

all-local: render

install-data-local:
	for size in $(symbolic_render_sizes); do \
		for file in `cd $(top_srcdir)/$(SVGOUTDIR)/$$size; find . -name "*.png"`; do \
			context="`dirname $$file`"; \
			$(mkdir_p) $(DESTDIR)$(themedir)/$$size/$$context; \
			$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file; \
		done; \
	done
	for file in `cd $(top_srcdir)/$(SVGOUTDIR)/scalable; find . -name "*.svg"`; do \
		context="`dirname $$file`"; \
		$(mkdir_p) $(DESTDIR)$(themedir)/scalable/$$context; \
		$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/scalable/$$file $(DESTDIR)$(themedir)/scalable/$$file; \
		for size in $(symbolic_encode_sizes); do \
			$(mkdir_p) $(DESTDIR)$(themedir)/$$size/$$context; \
			$(GTK_ENCODE_SYMBOLIC_SVG) $(top_srcdir)/$(SVGOUTDIR)/scalable/$$file $$size -o $(DESTDIR)$(themedir)/$$size/$$context; \
		done \
	done

uninstall-local:
	for file in `cd $(top_srcdir)/$(SVGOUTDIR)/scalable; find . -name "*.svg"`; do \
		context="`dirname $$file`"; \
		rm -f $(DESTDIR)$(themedir)/scalable/$$file; \
		for size in $(symbolic_encode_sizes); do \
			name="`basename $$file .svg`.symbolic.png"; \
			rm -f $(DESTDIR)/$(themedir)/$$size/$$context/$$name; \
		done; \
	done

EXTRA_DIST =			\
	$(icon_in_files)


MAINTAINERCLEANFILES =		\
	*~			\
	Makefile.in		\
	$(icon_cache)

-include $(top_srcdir)/git.mk
