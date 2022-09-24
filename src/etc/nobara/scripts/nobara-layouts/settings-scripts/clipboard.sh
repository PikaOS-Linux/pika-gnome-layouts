#! /bin/bash

# Get needed extensions into userland

if [[ $1 == enable ]]; then
	if [[ -d "$HOME/.local/share/gnome-shell/extensions/gnome-clipboard@b00f.github.io" ]]; then
		echo "clipboard already in userland no need to download anything"
		echo "Enabling Now"
	   	gnome-extensions enable gnome-clipboard@b00f.github.io
	else
		mkdir -p "$HOME/.cache/nobara-layouts/extensions/"
		cd "$HOME/.cache/nobara-layouts/extensions/"
		ls gnome-clipboardb00f.github.io.v11.shell-extension.zip || wget  https://extensions.gnome.org/extension-data/gnome-clipboardb00f.github.io.v11.shell-extension.zip
		gnome-extensions install "$HOME/.cache/nobara-layouts/extensions/gnome-clipboardb00f.github.io.v11.shell-extension.zip"	
		export RELOG_NEEDED=1
		
		if [[ $ALL != True ]]; then
		/etc/nobara/scripts/nobara-layouts/reload.sh
		fi
	fi
else
echo "Disabling Now"
gnome-extensions disable gnome-clipboard@b00f.github.io
fi
