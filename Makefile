# Configuration
SHELL = /bin/sh
MKDIR_P = mkdir -p

all:
	@echo "Type 'make install' or 'make uninstall'"
	@echo
	@echo "make install"
	@echo "   Will copy files to /usr/local/bin"
	@echo ""
	@echo "make uninstall"
	@echo "   Will remove files from /usr/local/bin"

install:
	@# Create dir
	${MKDIR_P} /usr/local/bin/
	@# Copy files
	install -m 0755 bin/system-hibernate /usr/local/bin/system-hibernate
	install -m 0755 bin/system-reboot    /usr/local/bin/system-reboot
	install -m 0755 bin/system-shutdown  /usr/local/bin/system-shutdown
	install -m 0755 bin/system-suspend   /usr/local/bin/system-suspend
	install -m 0755 bin/rcalc            /usr/local/bin/rcalc
	install -m 0755 bin/xcolorpick       /usr/local/bin/xcolorpick
	install -m 0755 bin/xf86-audio       /usr/local/bin/xf86-audio
	install -m 0755 bin/xf86-backlight   /usr/local/bin/xf86-backlight
	install -m 0755 bin/ximage           /usr/local/bin/ximage
	install -m 0755 bin/xkiller          /usr/local/bin/xkiller
	install -m 0755 bin/xlock            /usr/local/bin/xlock
	install -m 0755 bin/xscreenshot      /usr/local/bin/xscreenshot

	install -m 0644 applications/ximage.desktop /usr/share/applications/ximage.desktop


uninstall:
	@# Remove files
	rm -f /usr/local/bin/system-hibernate
	rm -f /usr/local/bin/system-reboot
	rm -f /usr/local/bin/system-shutdown
	rm -f /usr/local/bin/system-suspend
	rm -f /usr/local/bin/rcalc
	rm -f /usr/local/bin/xcolorpick
	rm -f /usr/local/bin/xf86-audio
	rm -f /usr/local/bin/xf86-backlight
	rm -f /usr/local/bin/xkiller
	rm -f /usr/local/bin/xlock
	rm -f /usr/local/bin/xscreenshot

	rm -f /usr/share/applications/ximage.desktop
