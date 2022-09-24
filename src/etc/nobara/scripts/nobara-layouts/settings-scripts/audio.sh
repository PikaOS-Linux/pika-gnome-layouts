#! /bin/bash

# Get needed extensions into userland

if [[ $1 == enable ]]; then
	if [ -d "$HOME/.local/share/gnome-shell/extensions/volume-mixer@evermiss.net" ]; then
		echo "mixer already in userland no need to download anything"
		echo "Enabling Now"
	   	gnome-extensions enable volume-mixer@evermiss.net
	else
		mkdir -p "$HOME/.cache/nobara-layouts/extensions/"
		cd "$HOME/.cache/nobara-layouts/extensions/"
		ls volume-mixerevermiss.net.v10.shell-extension.zip || wget https://extensions.gnome.org/extension-data/volume-mixerevermiss.net.v10.shell-extension.zip
		gnome-extensions install "$HOME/.cache/nobara-layouts/extensions/volume-mixerevermiss.net.v10.shell-extension.zip"	
		export RELOG_NEEDED=1
	fi
	
	if [ -d "$HOME/.local/share/gnome-shell/extensions/sound-output-device-chooser@kgshank.net" ]; then
		echo "sound already in userland no need to download anything"
		echo "Enabling Now"
	   	gnome-extensions enable sound-output-device-chooser@kgshank.net
	else
		mkdir -p "$HOME/.cache/nobara-layouts/extensions/"
		cd "$HOME/.cache/nobara-layouts/extensions/"
		ls sound-output-device-chooserkgshank.net.v41.shell-extension.zip || wget https://extensions.gnome.org/extension-data/sound-output-device-chooserkgshank.net.v41.shell-extension.zip
		gnome-extensions install "$HOME/.cache/nobara-layouts/extensions/sound-output-device-chooserkgshank.net.v41.shell-extension.zip"	
		export RELOG_NEEDED=1
		/etc/nobara/scripts/nobara-layouts/settings-scripts/reload.sh
	fi
else
echo "Disabling Now"
gnome-extensions disable volume-mixer@evermiss.net
gnome-extensions disable sound-output-device-chooser@kgshank.net
fi
