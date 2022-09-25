#! /bin/bash

# Reset everything
/etc/nobara/scripts/nobara-layouts/layout-scripts/reset.sh

gnome-extensions reset Move_Clock@rmy.pobox.com
gnome-extensions reset just-perfection-desktop@just-perfection
gnome-extensions reset launch-new-instance@gnome-shell-extensions.gcampax.github.com
gnome-extensions reset places-menu@gnome-shell-extensions.gcampax.github.com
gnome-extensions reset window-list@gnome-shell-extensions.gcampax.github.com


dconf reset -f /org/gnome/shell/extensions/Move_Clock/
dconf reset -f /org/gnome/shell/extensions/just-perfection/
dconf reset -f /org/gnome/shell/extensions/launch-new-instance/
dconf reset -f /org/gnome/shell/extensions/places-menu/
dconf reset -f /org/gnome/shell/extensions/window-list/

# Get needed extensions into userland

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

# window list

if [ -d "$HOME/.local/share/gnome-shell/extensions/window-list@gnome-shell-extensions.gcampax.github.com" ]; then
	echo "window list already in userland no need to download anything"
else
	mkdir -p "$HOME/.cache/nobara-layouts/extensions/"
	cd "$HOME/.cache/nobara-layouts/extensions/"
	ls window-listgnome-shell-extensions.gcampax.github.com.v43.shell-extension.zip || wget https://extensions.gnome.org/extension-data/window-listgnome-shell-extensions.gcampax.github.com.v43.shell-extension.zip
	gnome-extensions install "$HOME/.cache/nobara-layouts/extensions/window-listgnome-shell-extensions.gcampax.github.com.v43.shell-extension.zip"	
	export RELOG_NEEDED=1
fi

# Launch new instance

if [ -d "$HOME/.local/share/gnome-shell/extensions/launch-new-instance@gnome-shell-extensions.gcampax.github.com" ]; then
	echo "launch new instance already in userland no need to download anything"
else
	mkdir -p "$HOME/.cache/nobara-layouts/extensions/"
	cd "$HOME/.cache/nobara-layouts/extensions/"
	ls launch-new-instancegnome-shell-extensions.gcampax.github.com.v34.shell-extension.zip || wget https://extensions.gnome.org/extension-data/launch-new-instancegnome-shell-extensions.gcampax.github.com.v34.shell-extension.zip
	gnome-extensions install "$HOME/.cache/nobara-layouts/extensions/launch-new-instancegnome-shell-extensions.gcampax.github.com.v34.shell-extension.zip"	
	export RELOG_NEEDED=1
fi

if [[ "$RELOG_NEEDED" == 1 ]]; then
	if zenity --question --text="New extensions have been installed!, reload required!"
	then
	gnome-session-quit --force --no-prompt
	fi
fi

# places menu

if [ -d "$HOME/.local/share/gnome-shell/extensions/places-menu@gnome-shell-extensions.gcampax.github.com" ]; then
	echo "places menu already in userland no need to download anything"
else
	mkdir -p "$HOME/.cache/nobara-layouts/extensions/"
	cd "$HOME/.cache/nobara-layouts/extensions/"
	ls places-menugnome-shell-extensions.gcampax.github.com.v54.shell-extension.zip || wget https://extensions.gnome.org/extension-data/places-menugnome-shell-extensions.gcampax.github.com.v54.shell-extension.zip
	gnome-extensions install "$HOME/.cache/nobara-layouts/extensions/places-menugnome-shell-extensions.gcampax.github.com.v54.shell-extension.zip"	
	export RELOG_NEEDED=1
fi

if [[ "$RELOG_NEEDED" == 1 ]]; then
	if zenity --question --text="New extensions have been installed!, reload required!"
	then
	gnome-session-quit --force --no-prompt
	fi
fi


if [[ "$RELOG_NEEDED" == 1 ]]; then
	if zenity --question --text="New extensions have been installed!, reload required!"
	then
	gnome-session-quit --force --no-prompt
	fi
fi

# add new settings

gsettings set org.gnome.shell.extensions.arcmenu menu-hotkey 'Super_L'

gsettings set org.gnome.shell.extensions.arcmenu menu-layout 'Eleven'

gsettings set org.gnome.shell.extensions.arcmenu menu-layout 'GnomeMenu'

gsettings set org.gnome.shell.extensions.arcmenu menu-button-appearance 'Text'

# Enable just perfection
gnome-extensions enable just-perfection-desktop@just-perfection
# Enable Move Clock
gnome-extensions enable Move_Clock@rmy.pobox.com
# Enable Launch New instance
gnome-extensions enable launch-new-instance@gnome-shell-extensions.gcampax.github.com
# Enable Places
gnome-extensions enable places-menu@gnome-shell-extensions.gcampax.github.com
# Enable window list
gnome-extensions enable window-list@gnome-shell-extensions.gcampax.github.com
