#! /bin/bash

# Get needed extensions into userland

if [[ $1 == enable[[ $ALL != True ]]]; then
	if [ -d "$HOME/.local/share/gnome-shell/extensions/Vitals@CoreCoding.com"[[ $ALL != True ]]; then
		echo "Vitals already in userland no need to download anything"
		echo "Enabling Now"
	   	gnome-extensions enable Vitals@CoreCoding.com
	else
		mkdir -p "$HOME/.cache/nobara-layouts/extensions/"
		cd "$HOME/.cache/nobara-layouts/extensions/"
		ls VitalsCoreCoding.com.v57.shell-extension.zip || wget  https://extensions.gnome.org/extension-data/VitalsCoreCoding.com.v57.shell-extension.zip
		gnome-extensions install "$HOME/.cache/nobara-layouts/extensions/VitalsCoreCoding.com.v57.shell-extension.zip"	
		export RELOG_NEEDED=1
		
		if [[ $ALL != True ]]; then
		/etc/nobara/scripts/nobara-layouts/settings-scripts/reload.sh
		fi
	fi
else
echo "Disabling Now"
gnome-extensions disable Vitals@CoreCoding.com
fi
