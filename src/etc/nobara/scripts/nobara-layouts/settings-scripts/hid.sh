#! /bin/bash

# Get needed extensions into userland

if [[ $1 == enable ]]; then
	if [ -d "$HOME/.local/share/gnome-shell/extensions/wireless-hid@chlumskyvaclav.gmail.com" ]; then
		echo "Wireless HID already in userland no need to download anything"
		echo "Enabling Now"
	   	gnome-extensions enable wireless-hid@chlumskyvaclav.gmail.com
	else
		mkdir -p "$HOME/.cache/nobara-layouts/extensions/"
		cd "$HOME/.cache/nobara-layouts/extensions/"
		ls wireless-hidchlumskyvaclav.gmail.com.v7.shell-extension.zip || wget  https://extensions.gnome.org/extension-data/wireless-hidchlumskyvaclav.gmail.com.v7.shell-extension.zip
		gnome-extensions install "$HOME/.cache/nobara-layouts/extensions/wireless-hidchlumskyvaclav.gmail.com.v7.shell-extension.zip"	
		export RELOG_NEEDED=1
		/etc/nobara/scripts/nobara-layouts/settings-scripts/reload.sh
	fi
else
echo "Disabling Now"
gnome-extensions disable wireless-hid@chlumskyvaclav.gmail.com
fi
