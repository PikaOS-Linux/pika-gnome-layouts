#! /bin/bash

# Get needed extensions into userland

if [[ $1 == enable ]]; then
	if [ -d "$HOME/.local/share/gnome-shell/extensions/ding@rastersoft.com" ]; then
		echo "desktop already in userland no need to download anything"
		echo "Enabling Now"
	   	gnome-extensions enable ding@rastersoft.com
	else
		mkdir -p "$HOME/.cache/nobara-layouts/extensions/"
		cd "$HOME/.cache/nobara-layouts/extensions/"
		ls dingrastersoft.com.v43.shell-extension.zip || wget  https://extensions.gnome.org/extension-data/dingrastersoft.com.v43.shell-extension.zip
		gnome-extensions install "$HOME/.cache/nobara-layouts/extensions/dingrastersoft.com.v43.shell-extension.zip"	
		export RELOG_NEEDED=1
		
		if [[ $ALL != True ]]; then
		/etc/nobara/scripts/nobara-layouts/settings-scripts/reload.sh
		fi
	fi
echo "Disabling Now"
gnome-extensions disable ding@rastersoft.com
fi
