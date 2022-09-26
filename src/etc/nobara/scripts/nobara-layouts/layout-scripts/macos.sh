#! /bin/bash

# Reset everything
/etc/nobara/scripts/nobara-layouts/layout-scripts/reset.sh ||

gnome-extensions reset dash-to-dock@micxgx.gmail.com ||
gnome-extensions reset Move_Clock@rmy.pobox.com ||
gnome-extensions reset just-perfection-desktop@just-perfection ||

dconf reset -f /org/gnome/shell/extensions/dash-to-dock/ ||
dconf reset -f /org/gnome/shell/extensions/Move_Clock/ ||
dconf reset -f /org/gnome/shell/extensions/just-perfection/ ||

# Enable Dash
gnome-extensions enable dash-to-dock@micxgx.gmail.com
# Enable just perfection
gnome-extensions enable just-perfection-desktop@just-perfection
# Enable Move Clock
gnome-extensions enable Move_Clock@rmy.pobox.com
