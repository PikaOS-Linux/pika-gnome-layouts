#! /bin/bash

# Reset everything

#
dconf reset -f /org/gnome/shell/extensions/arcmenu/ || echo
dconf reset -f /org/gnome/shell/extensions/dash-to-dock/ || echo
dconf reset -f /org/gnome/shell/extensions/dash-to-panel/ || echo
dconf reset -f /org/gnome/shell/extensions/just-perfection/ || echo
gnome-extensions reset arcmenu@arcmenu.com || echo
gnome-extensions reset pika-dock@pika.com || echo
gnome-extensions reset dash-to-panel@jderose9.github.com || echo
gnome-extensions reset just-perfection-desktop@just-perfection || echo
gnome-extensions reset launch-new-instance@gnome-shell-extensions.gcampax.github.com || echo
gnome-extensions reset places-menu@gnome-shell-extensions.gcampax.github.com || echo
gnome-extensions reset window-list@gnome-shell-extensions.gcampax.github.com || echo

# add new settings

dconf write /org/gnome/desktop/wm/preferences/button-layout "'close,minimize,maximize:appmenu'"

dconf write /org/gnome/shell/extensions/dash-to-dock/dash-max-icon-size 48

dconf write /org/gnome/shell/extensions/dash-to-dock/dock-fixed true

dconf write /org/gnome/shell/extensions/dash-to-dock/extend-height false

dconf write /org/gnome/shell/extensions/dash-to-dock/dock-position "'BOTTOM'"

#

dconf write /org/gnome/shell/extensions/just-perfection/clock-menu-position 1

# Enable Dock
gnome-extensions enable pika-dock@pika.com
# Enable just perfection
gnome-extensions enable just-perfection-desktop@just-perfection
# Enable Desktop Icons
gnome-extensions enable ding@rastersoft.com
