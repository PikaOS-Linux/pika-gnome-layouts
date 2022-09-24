#! /bin/bash

# Reset everything
/etc/nobara/scripts/nobara-layouts/layout-scripts/reset.sh

gnome-extensions reset dash-to-dock@micxgx.gmail.com
gnome-extensions reset Move_Clock@rmy.pobox.com
gnome-extensions reset just-perfection-desktop@just-perfection

dconf reset -f /org/gnome/shell/extensions/dash-to-dock/
dconf reset -f /org/gnome/shell/extensions/Move_Clock/
dconf reset -f /org/gnome/shell/extensions/just-perfection/

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

# Frippery Move Clock

if [ -d "$HOME/.local/share/gnome-shell/extensions/Move_Clock@rmy.pobox.com" ]; then
	echo "Frippery Move Clock already in userland no need to download anything"
else
	mkdir -p "$HOME/.cache/nobara-layouts/extensions/"
	cd "$HOME/.cache/nobara-layouts/extensions/"
	ls ./Move_Clockrmy.pobox.com.v27.shell-extension.zip || wget  https://extensions.gnome.org/extension-data/Move_Clockrmy.pobox.com.v27.shell-extension.zip
	gnome-extensions install "$HOME/.cache/nobara-layouts/extensions/Move_Clockrmy.pobox.com.v27.shell-extension.zip"
	export RELOG_NEEDED=1
fi

# Just Perfection

if [ -d "$HOME/.local/share/gnome-shell/extensions/just-perfection-desktop@just-perfection" ]; then
	echo "just perfection already in userland no need to download anything"
else
	mkdir -p "$HOME/.cache/nobara-layouts/extensions/"
	cd "$HOME/.cache/nobara-layouts/extensions/"
	ls just-perfection-desktopjust-perfection.v22.shell-extension.zip || wget https://extensions.gnome.org/extension-data/just-perfection-desktopjust-perfection.v22.shell-extension.zip
	gnome-extensions install "$HOME/.cache/nobara-layouts/extensions/just-perfection-desktopjust-perfection.v22.shell-extension.zip"	
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
# Enable just perfection
gnome-extensions enable just-perfection-desktop@just-perfection
# Enable Move Clock
gnome-extensions enable Move_Clock@rmy.pobox.com
