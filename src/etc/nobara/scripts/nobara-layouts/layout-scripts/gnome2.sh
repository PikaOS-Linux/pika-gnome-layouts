#! /bin/bash

# Reset everything

gnome-extensions reset Move_Clock@rmy.pobox.com || echo
gnome-extensions reset just-perfection-desktop@just-perfection || echo
gnome-extensions reset launch-new-instance@gnome-shell-extensions.gcampax.github.com || echo
gnome-extensions reset arcmenu@arcmenu.com || echo
gnome-extensions reset places-menu@gnome-shell-extensions.gcampax.github.com || echo
gnome-extensions reset window-list@gnome-shell-extensions.gcampax.github.com || echo


dconf reset -f /org/gnome/shell/extensions/Move_Clock/ || echo
dconf reset -f /org/gnome/shell/extensions/just-perfection/ || echo
dconf reset -f /org/gnome/shell/extensions/launch-new-instance/ || echo
dconf reset -f /org/gnome/shell/extensions/places-menu/ || echo
dconf reset -f /org/gnome/shell/extensions/window-list/ || echo
dconf reset -f /org/gnome/shell/extensions/arcmenu/ || echo

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
# Enable arcmenu
gnome-extensions enable arcmenu@arcmenu.com
