#! /usr/bin/bash
# Enable extensions
gnome-extensions enable custom-accent-colors@demiskp
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
# Set accent color settings
dconf write /org/gnome/shell/extensions/custom-accent-colors/accent-color "'"$1"'"
dconf write /org/gnome/shell/extensions/custom-accent-colors/theme-flatpak true
dconf write /org/gnome/shell/extensions/custom-accent-colors/theme-gtk3 true
dconf write /org/gnome/shell/extensions/custom-accent-colors/theme-shell true
# Refresh Shell
dconf write /org/gnome/shell/extensions/user-theme/name "''"
dconf write /org/gnome/shell/extensions/user-theme/name "'CustomAccentColors'"
