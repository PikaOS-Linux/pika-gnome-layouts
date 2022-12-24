#! /bin/bash

# Reset everything

# Reset everything

#
dconf reset -f /org/gnome/shell/extensions/arcmenu/ || echo
dconf reset -f /org/gnome/shell/extensions/dash-to-dock/ || echo
dconf reset -f /org/gnome/shell/extensions/dash-to-panel/ || echo
dconf reset -f /org/gnome/shell/extensions/just-perfection/ || echo
gnome-extensions reset arcmenu@arcmenu.com || echo
gnome-extensions reset ubuntu-dock@ubuntu.com || echo
gnome-extensions reset dash-to-panel@jderose9.github.com || echo
gnome-extensions reset just-perfection-desktop@just-perfection || echo
gnome-extensions reset launch-new-instance@gnome-shell-extensions.gcampax.github.com || echo
gnome-extensions reset places-menu@gnome-shell-extensions.gcampax.github.com || echo
gnome-extensions reset window-list@gnome-shell-extensions.gcampax.github.com || echo

# add new settings
dconf write /org/gnome/desktop/wm/preferences/button-layout "'appmenu:minimize,maximize,close'"

dconf write /org/gnome/shell/extensions/arcmenu/menu-hotkey "'Super_L'"

dconf write /org/gnome/shell/extensions/arcmenu/force-menu-location "'BottomCentered'"

dconf write /org/gnome/shell/extensions/arcmenu/menu-button-position-offset 1

dconf write /org/gnome/shell/extensions/arcmenu/menu-layout "'Eleven'"

dconf write /org/gnome/shell/extensions/arcmenu/position-in-panel "'Center'"

dconf write /org/gnome/shell/extensions/arcmenu/show-activities-button 'true'

gsettings set org.gnome.shell.extensions.dash-to-panel panel-element-positions '{"0":[{"element":"showAppsButton","visible":false,"position":"stackedTL"},{"element":"leftBox","visible":true,"position":"stackedTL"},{"element":"taskbar","visible":true,"position":"centerMonitor"},{"element":"centerBox","visible":true,"position":"stackedBR"},{"element":"rightBox","visible":true,"position":"stackedBR"},{"element":"activitiesButton","visible":true,"position":"stackedTL"},{"element":"dateMenu","visible":true,"position":"stackedBR"},{"element":"systemMenu","visible":true,"position":"stackedBR"},{"element":"desktopButton","visible":true,"position":"stackedBR"}]}'

# Enable taskbar
gnome-extensions enable dash-to-panel@jderose9.github.com
# Enable arcmenu
gnome-extensions enable arcmenu@arcmenu.com
# Enable just perfection
gnome-extensions enable just-perfection-desktop@just-perfection
# Enable Desktop Icons
gnome-extensions enable ding@rastersoft.com
