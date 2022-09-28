#! /bin/bash

# Reset everything

gnome-extensions reset dash-to-panel@jderose9.github.com || echo
gnome-extensions reset arcmenu@arcmenu.com || echo
gnome-extensions reset just-perfection-desktop@just-perfection || echo

dconf reset -f /org/gnome/shell/extensions/dash-to-panel/ || echo
dconf reset -f /org/gnome/shell/extensions/just-perfection/ || echo
dconf reset -f /org/gnome/shell/extensions/arcmenu/ || echo

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
# Enable arcmenu
gnome-extensions enable arcmenu@arcmenu.com
# Enable just perfection
gnome-extensions enable just-perfection-desktop@just-perfection
