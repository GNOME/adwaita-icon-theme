
size = 48x48
context = status

iconsdir = $(themedir)/$(size)/$(context)

icons_DATA =				\
	appointment-missed.png		\
	appointment-soon.png		\
	dialog-error.png		\
	dialog-information.png		\
	dialog-warning.png		\
	weather-few-clouds.png		\
	weather-few-clouds-night.png	\
	weather-fog.png			\
	weather-overcast.png		\
	weather-showers.png		\
	weather-snow.png		\
	weather-storm.png

EXTRA_DIST =				\
	$(icons_DATA)

install-data-local: install-iconsDATA
	(cd $(DESTDIR)$(themedir)/$(size) && $(ICONMAP) -c $(context))

