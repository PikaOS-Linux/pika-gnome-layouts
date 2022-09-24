#! /bin/bash

# Get needed extensions into userland


if [[ $1 == enable ]]; then
	if [ -d "$HOME/.local/share/gnome-shell/extensions/trayIconsReloaded@selfmade.pl" ]; then
		echo "tray icons already in userland no need to download anything"
		echo "Enabling Now"
	   	gnome-extensions enable trayIconsReloaded@selfmade.pl
	else
		mkdir -p "$HOME/.cache/nobara-layouts/extensions/"
		cd "$HOME/.cache/nobara-layouts/extensions/"
		ls trayIconsReloadedselfmade.pl.v26.shell-extension.zip || wget https://extensions.gnome.org/extension-data/trayIconsReloadedselfmade.pl.v26.shell-extension.zip
		gnome-extensions install "$HOME/.cache/nobara-layouts/extensions/trayIconsReloadedselfmade.pl.v26.shell-extension.zip"	
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
gnome-extensions disable trayIconsReloaded@selfmade.pl
fi