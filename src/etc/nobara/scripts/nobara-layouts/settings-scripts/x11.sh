#! /bin/bash

# Get needed extensions into userland

if [[ $1 == enable ]]; then
	if [[ -d "$HOME/.local/share/gnome-shell/extensions/gestureImprovements@gestures" ]]; then
		echo "gestures already in userland no need to download anything"
		echo "Enabling Now"
	   	gnome-extensions enable x11gestures@joseexposito.github.io
	else
		mkdir -p "$HOME/.cache/nobara-layouts/extensions/"
		cd "$HOME/.cache/nobara-layouts/extensions/"
		ls gestureImprovementsgestures.v22.shell-extension.zip || wget  https://extensions.gnome.org/extension-data/gestureImprovementsgestures.v22.shell-extension.zip
		gnome-extensions install "$HOME/.cache/nobara-layouts/extensions/gestureImprovementsgestures.v22.shell-extension.zip"	
		export RELOG_NEEDED=1
		
		if [[ $ALL != True ]]; then
		/etc/nobara/scripts/nobara-layouts/reload.sh
		fi
	fi
else
echo "Disabling Now"
gnome-extensions disable gestureImprovements@gestures
fi
