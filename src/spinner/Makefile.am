
icon_in_files = $(shell SRCDIR="$(srcdir)"; for i in `find $$SRCDIR -name "*.svg"`; do printf "$$i "; done)

if ALLOW_RENDERING
render-png: $(icon_in_files) Makefile
	for file in $(icon_in_files); do \
		size='scalable-up-to-32' \
		$(ICONTOOL_RENDER) -s $$size -o $(top_builddir)/$(SVGOUTDIR) $$file >/dev/null; \
	done

else
render-png: $(icon_in_files) Makefile

endif

$(symbolic_render_sizes): Makefile

render: render-png

all-local: render

install-data-local:
	      size='scalable-up-to-32' ; \
	      for file in `cd $(top_srcdir)/$(SVGOUTDIR)/$$size; find . -name "*.png"`; do \
		      context="`dirname $$file`"; \
		      $(mkdir_p) $(DESTDIR)$(themedir)/$$size/$$context; \
		      $(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/$$size/$$file $(DESTDIR)$(themedir)/$$size/$$file; \
	      done; \
	for file in `cd $(top_srcdir)/$(SVGOUTDIR)/scalable-up-to-32; find . -name "*.svg"`; do \
		context="`dirname $$file`"; \
		$(mkdir_p) $(DESTDIR)$(themedir)/scalable-up-to-32/$$context; \
		$(install_sh_DATA) $(top_srcdir)/$(SVGOUTDIR)/scalable-up-to-32/$$file $(DESTDIR)$(themedir)/scalable-up-to-32/$$file; \
	done

uninstall-local:
	      for file in `cd $(top_srcdir)/$(SVGOUTDIR)/scalable-up-to-32; find . -name "*.svg"`; do \
		      rm -f $(DESTDIR)$(themedir)/scalable-up-to-32/$$file; \
	      done

EXTRA_DIST =			\
	$(icon_in_files)


MAINTAINERCLEANFILES =		\
	*~			\
	Makefile.in		\
	$(icon_cache)

-include $(top_srcdir)/git.mk
