#! /bin/bash

# Reset everything

gnome-extensions reset dash-to-dock@micxgx.gmail.com || echo
gnome-extensions reset Move_Clock@rmy.pobox.com || echo
gnome-extensions reset just-perfection-desktop@just-perfection || echo

dconf reset -f /org/gnome/shell/extensions/dash-to-dock/ || echo
dconf reset -f /org/gnome/shell/extensions/Move_Clock/ || echo
dconf reset -f /org/gnome/shell/extensions/just-perfection/ || echo

# Enable Dock
gnome-extensions enable dash-to-dock@micxgx.gmail.com
# Enable just perfection
gnome-extensions enable just-perfection-desktop@just-perfection
# Enable Move Clock
gnome-extensions enable Move_Clock@rmy.pobox.com
