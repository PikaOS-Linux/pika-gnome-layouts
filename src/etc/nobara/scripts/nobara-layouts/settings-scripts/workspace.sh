#! /bin/bash

# Get needed extensions into userland

if [[ $1 == enable[[ $ALL != True ]]]; then
	if [ -d "$HOME/.local/share/gnome-shell/extensions/auto-move-windows@gnome-shell-extensions.gcampax.github.com"[[ $ALL != True ]]; then
		echo "workspace already in userland no need to download anything"
		echo "Enabling Now"
	   	gnome-extensions enable auto-move-windows@gnome-shell-extensions.gcampax.github.com
	else
		mkdir -p "$HOME/.cache/nobara-layouts/extensions/"
		cd "$HOME/.cache/nobara-layouts/extensions/"
		ls auto-move-windowsgnome-shell-extensions.gcampax.github.com.v50.shell-extension.zip || wget  https://extensions.gnome.org/extension-data/auto-move-windowsgnome-shell-extensions.gcampax.github.com.v50.shell-extension.zip
		gnome-extensions install "$HOME/.cache/nobara-layouts/extensions/auto-move-windowsgnome-shell-extensions.gcampax.github.com.v50.shell-extension.zip"	
		export RELOG_NEEDED=1
		
		if [[ $ALL != True ]]; then
		/etc/nobara/scripts/nobara-layouts/settings-scripts/reload.sh
		fi
	fi
else
echo "Disabling Now"
gnome-extensions disable auto-move-windows@gnome-shell-extensions.gcampax.github.com
fi
