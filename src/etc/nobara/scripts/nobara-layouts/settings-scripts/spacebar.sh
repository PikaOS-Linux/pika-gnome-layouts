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
	fi
	
	if [[ "$RELOG_NEEDED" == 1 ]]; then
		if zenity --question --text="New extensions have been installed!, reload required!"
		then
		gnome-session-quit --force --no-prompt
		fi
	fi
else
echo "Disabling Now"
gnome-extensions disable space-bar@luchrioh
fi
