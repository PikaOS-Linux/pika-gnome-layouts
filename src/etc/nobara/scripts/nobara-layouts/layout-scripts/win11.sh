#! /bin/bash

# Reset everything
/etc/nobara/scripts/nobara-layouts/layout-scripts/reset.sh

gnome-extensions reset dash-to-panel@jderose9.github.com
gnome-extensions reset arcmenu@arcmenu.com

dconf reset -f /org/gnome/shell/extensions/dash-to-panel/

dconf reset -f /org/gnome/shell/extensions/arcmenu/

# Get needed extensions into userland

# Dash to panel

if [ -d "$HOME/.local/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com" ]; then
	echo "dash to panel already in userland no need to download anything"
else
	mkdir -p "$HOME/.cache/nobara-layouts/extensions/"
	cd "$HOME/.cache/nobara-layouts/extensions/"
	ls ./dash-to-panel@jderose9.github.com_v51.zip || wget  https://github.com/home-sweet-gnome/dash-to-panel/releases/download/v51/dash-to-panel@jderose9.github.com_v51.zip
	gnome-extensions install "$HOME/.cache/nobara-layouts/extensions/dash-to-panel@jderose9.github.com_v51.zip"
	export RELOG_NEEDED=1
fi

# Arcmenu

if [ -d "$HOME/.local/share/gnome-shell/extensions/arcmenu@arcmenu.com" ]; then
	echo "arcmenu already in userland no need to download anything"
else
	mkdir -p "$HOME/.cache/nobara-layouts/extensions/"
	cd "$HOME/.cache/nobara-layouts/extensions/"
	ls arcmenuarcmenu.com.v39.shell-extension.zip || wget  https://extensions.gnome.org/extension-data/arcmenuarcmenu.com.v39.shell-extension.zip
	gnome-extensions install "$HOME/.cache/nobara-layouts/extensions/arcmenuarcmenu.com.v39.shell-extension.zip"	
	export RELOG_NEEDED=1
fi

if [[ "$RELOG_NEEDED" == 1 ]]; then
	if zenity --question --text="New extensions have been installed!, reload required!"
	then
	gnome-session-quit --force --no-prompt
	fi
fi

# add new settings
gsettings set org.gnome.shell.extensions.arcmenu menu-hotkey 'Super_L'

gsettings set org.gnome.shell.extensions.arcmenu force-menu-location 'BottomCentered'

gsettings set org.gnome.shell.extensions.arcmenu menu-button-position-offset 1

gsettings set org.gnome.shell.extensions.arcmenu menu-layout 'Eleven'

gsettings set org.gnome.shell.extensions.arcmenu position-in-panel 'Center'

gsettings set org.gnome.shell.extensions.arcmenu show-activities-button 'true'

gsettings set org.gnome.shell.extensions.dash-to-panel panel-element-positions '{"0":[{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"taskbar","visible":true,"position":"centerMonitor"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"activitiesButton","visible":true,"position":"stackedBR"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}]}'

# Enable taskbar
gnome-extensions enable dash-to-panel@jderose9.github.com
# Enable appmenu
gnome-extensions enable arcmenu@arcmenu.com

