#! /bin/bash

# Get needed extensions into userland


if [[ $1 == enable ]]; then
	if [[ -d "$HOME/.local/share/gnome-shell/extensions/blur-my-shell@aunetx" ]]; then
		echo "blur my shell already in userland no need to download anything"
		echo "Enabling Now"
	   	gnome-extensions enable blur-my-shell@aunetx
	else
		mkdir -p "$HOME/.cache/nobara-layouts/extensions/"
		cd "$HOME/.cache/nobara-layouts/extensions/"
		ls blur-my-shellaunetx.v28.shell-extension.zip || wget https://extensions.gnome.org/extension-data/blur-my-shellaunetx.v28.shell-extension.zip
		gnome-extensions install "$HOME/.cache/nobara-layouts/extensions/blur-my-shellaunetx.v28.shell-extension.zip"	
		export RELOG_NEEDED=1
		
		if [[ $ALL != True ]]; then
		/etc/nobara/scripts/nobara-layouts/reload.sh
		fi
	fi
else
echo "Disabling Now"
gnome-extensions disable blur-my-shell@aunetx
fi
