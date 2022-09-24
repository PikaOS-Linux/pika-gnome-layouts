#! /bin/bash

# Get needed extensions into userland

if [[ $1 == enable ]]; then
	if [ -d "$HOME/.local/share/gnome-shell/extensions/gsconnect@andyholmes.github.io" ]; then
		echo "gsconnect already in userland no need to download anything"
		echo "Enabling Now"
	   	gnome-extensions enable gsconnect@andyholmes.github.io
	else
		mkdir -p "$HOME/.cache/nobara-layouts/extensions/"
		cd "$HOME/.cache/nobara-layouts/extensions/"
		ls gsconnectandyholmes.github.io.v50.shell-extension.zip || wget  https://extensions.gnome.org/extension-data/gsconnectandyholmes.github.io.v50.shell-extension.zip
		gnome-extensions install "$HOME/.cache/nobara-layouts/extensions/gsconnectandyholmes.github.io.v50.shell-extension.zip"	
		export RELOG_NEEDED=1
		
		if [[$ALL != True]]; then
		/etc/nobara/scripts/nobara-layouts/settings-scripts/reload.sh
		fi
	fi
else
echo "Disabling Now"
gnome-extensions disable gsconnect@andyholmes.github.io
fi
