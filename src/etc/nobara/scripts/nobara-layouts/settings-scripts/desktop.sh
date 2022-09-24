#! /bin/bash

# Get needed extensions into userland

# Dash to panel
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
	fi
	
	if [[ "$RELOG_NEEDED" == 1 ]]; then
		if zenity --question --text="New extensions have been installed!, reload required!"
		then
		gnome-session-quit --force --no-prompt
		fi
	fi
else
echo "Disabling Now"
gnome-extensions disable ding@rastersoft.com
fi
