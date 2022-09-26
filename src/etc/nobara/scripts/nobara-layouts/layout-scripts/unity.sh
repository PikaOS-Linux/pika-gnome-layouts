#! /bin/bash

# Reset everything
/etc/nobara/scripts/nobara-layouts/layout-scripts/reset.sh ||

gnome-extensions reset dash-to-dock@micxgx.gmail.com ||
gnome-extensions reset just-perfection-desktop@just-perfection ||

dconf reset -f /org/gnome/shell/extensions/dash-to-dock/ ||
dconf reset -f /org/gnome/shell/extensions/just-perfection/ ||

# add new settings

gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 64

gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed true

gsettings set org.gnome.shell.extensions.dash-to-dock extend-height true

gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'LEFT'

# Enable Dash
gnome-extensions enable dash-to-dock@micxgx.gmail.com
# Enable just perfection
gnome-extensions enable just-perfection-desktop@just-perfection


