#! /bin/bash

# Get needed extensions into userland

if [[ $1 == enable ]]; then
	if [ -d "$HOME/.local/share/gnome-shell/extensions/openweather-extension@jenslody.de" ]; then
		echo "weather already in userland no need to download anything"
		echo "Enabling Now"
	   	gnome-extensions enable openweather-extension@jenslody.de
	else
		mkdir -p "$HOME/.cache/nobara-layouts/extensions/"
		cd "$HOME/.cache/nobara-layouts/extensions/"
		ls openweather-extensionjenslody.de.v119.shell-extension.zip || wget  https://extensions.gnome.org/extension-data/openweather-extensionjenslody.de.v119.shell-extension.zip
		gnome-extensions install "$HOME/.cache/nobara-layouts/extensions/openweather-extensionjenslody.de.v119.shell-extension.zip"	
		export RELOG_NEEDED=1
		
		if [[$ALL != True]]; then
		/etc/nobara/scripts/nobara-layouts/settings-scripts/reload.sh
		fi
	fi
else
echo "Disabling Now"
gnome-extensions disable openweather-extension@jenslody.de
fi
