#! /bin/bash

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

dconf write /org/gnome/shell/extensions/arcmenu/menu-layout "'GnomeMenu'"

dconf write /org/gnome/shell/extensions/arcmenu/menu-button-appearance "'Text'"

# Enable just perfection
gnome-extensions enable just-perfection-desktop@just-perfection
# Enable Launch New instance
gnome-extensions enable launch-new-instance@gnome-shell-extensions.gcampax.github.com
# Enable Places
gnome-extensions enable places-menu@gnome-shell-extensions.gcampax.github.com
# Enable window list
gnome-extensions enable window-list@gnome-shell-extensions.gcampax.github.com
# Enable arcmenu
gnome-extensions enable arcmenu@arcmenu.com
# Enable Desktop Icons
gnome-extensions enable ding@rastersoft.com
