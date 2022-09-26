#! /bin/bash

# Reset everything
/etc/nobara/scripts/nobara-layouts/layout-scripts/reset.sh ||

gnome-extensions reset Move_Clock@rmy.pobox.com ||
gnome-extensions reset just-perfection-desktop@just-perfection ||
gnome-extensions reset launch-new-instance@gnome-shell-extensions.gcampax.github.com ||
gnome-extensions reset arcmenu@arcmenu.com ||
gnome-extensions reset places-menu@gnome-shell-extensions.gcampax.github.com ||
gnome-extensions reset window-list@gnome-shell-extensions.gcampax.github.com ||


dconf reset -f /org/gnome/shell/extensions/Move_Clock/ ||
dconf reset -f /org/gnome/shell/extensions/just-perfection/ ||
dconf reset -f /org/gnome/shell/extensions/launch-new-instance/ ||
dconf reset -f /org/gnome/shell/extensions/places-menu/ ||
dconf reset -f /org/gnome/shell/extensions/window-list/ ||
dconf reset -f /org/gnome/shell/extensions/arcmenu/ ||

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
