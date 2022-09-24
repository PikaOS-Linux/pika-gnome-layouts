#! /bin/bash

# Get needed extensions into userland

if [[ $1 == enable[[ $ALL != True ]]]; then
	if [ -d "$HOME/.local/share/gnome-shell/extensions/supergfxctl-gex@asus-linux.org"[[ $ALL != True ]]; then
		echo "supergfxctl already in userland no need to download anything"
		echo "Enabling Now"
	   	gnome-extensions enable supergfxctl-gex@asus-linux.org
	else
		mkdir -p "$HOME/.cache/nobara-layouts/extensions/"
		cd "$HOME/.cache/nobara-layouts/extensions/"
		ls supergfxctl-gexasus-linux.org.v15.shell-extension.zip || wget  https://extensions.gnome.org/extension-data/supergfxctl-gexasus-linux.org.v15.shell-extension.zip
		gnome-extensions install "$HOME/.cache/nobara-layouts/extensions/supergfxctl-gexasus-linux.org.v15.shell-extension.zip"	
		export RELOG_NEEDED=1
		
		if [[ $ALL != True ]]; then
		/etc/nobara/scripts/nobara-layouts/settings-scripts/reload.sh
		fi
	fi
else
echo "Disabling Now"
gnome-extensions disable supergfxctl-gex@asus-linux.org
fi
