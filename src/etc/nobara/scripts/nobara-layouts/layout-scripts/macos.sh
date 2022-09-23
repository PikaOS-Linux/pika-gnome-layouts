#! /bin/bash

# Reset everything
/etc/nobara/scripts/nobara-layouts/layout-scripts/reset.sh

gnome-extensions reset dash-to-dock@micxgx.gmail.com

dconf reset -f /org/gnome/shell/extensions/dash-to-dock/

# Get needed extensions into userland

# Dash to Dock

if [ -d "$HOME/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com" ]; then
	echo "dash to dock already in userland no need to download anything"
else
	mkdir -p "$HOME/.cache/nobara-layouts/extensions/"
	cd "$HOME/.cache/nobara-layouts/extensions/"
	ls ./dash-to-dockmicxgx.gmail.com.v73.shell-extension.zip || wget  https://extensions.gnome.org/extension-data/dash-to-dockmicxgx.gmail.com.v73.shell-extension.zip
	gnome-extensions install "$HOME/.cache/nobara-layouts/extensions/dash-to-dockmicxgx.gmail.com.v73.shell-extension.zip"
	export RELOG_NEEDED=1
fi

if [[ "$RELOG_NEEDED" == 1 ]]; then
	if zenity --question --text="New extensions have been installed!, reload required!"
	then
	gnome-session-quit --force --no-prompt
	fi
fi

# Enable Dash
gnome-extensions enable dash-to-dock@micxgx.gmail.com

