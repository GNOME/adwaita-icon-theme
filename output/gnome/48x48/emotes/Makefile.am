themedir = $(datadir)/icons/gnome/48x48/emotes
theme_DATA =   face-angel.png face-angry.png face-cool.png face-crying.png face-devilish.png face-embarrassed.png face-kiss.png face-laugh.png face-monkey.png face-plain.png face-raspberry.png face-sad.png face-sick.png face-smile-big.png face-smile.png face-smirk.png face-surprise.png face-tired.png face-uncertain.png face-wink.png face-worried.png
EXTRA_DIST = $(theme_DATA)
install-data-local: install-themeDATA
	(cd "$(DESTDIR)$(themedir)" && $(ICONMAP) -c emotes )
MAINTAINERCLEANFILES = Makefile.in
