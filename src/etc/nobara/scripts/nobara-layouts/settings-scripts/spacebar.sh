#! /bin/bash

# Get needed extensions into userland

if [[ $1 == enable ]]; then
	if [ -d "$HOME/.local/share/gnome-shell/extensions/space-bar@luchrioh" ]; then
		echo "spacebar already in userland no need to download anything"
		echo "Enabling Now"
	   	gnome-extensions enable space-bar@luchrioh
	else
		mkdir -p "$HOME/.cache/nobara-layouts/extensions/"
		cd "$HOME/.cache/nobara-layouts/extensions/"
		ls space-barluchrioh.v2.shell-extension.zip || wget  https://extensions.gnome.org/extension-data/space-barluchrioh.v2.shell-extension.zip
		gnome-extensions install "$HOME/.cache/nobara-layouts/extensions/space-barluchrioh.v2.shell-extension.zip"	
		export RELOG_NEEDED=1
		
		if [[ $ALL != True ]]; then
		/etc/nobara/scripts/nobara-layouts/reload.sh
		fi
	fi
else
echo "Disabling Now"
gnome-extensions disable space-bar@luchrioh
fi
