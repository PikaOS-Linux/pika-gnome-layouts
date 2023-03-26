#! /bin/bash

# Remove current libadwaita theme
rm -rfv $HOME/.config/gtk-4.0

# Import Theme Settings From system dir
if [ -f /etc/pika_theme ]
then
. "/etc/pika_theme"
fi

# Import Theme Settings From user dir
if [ -f $HOME/.config/pika_theme ]
then
. "$HOME/.config/pika_theme"
fi

if [[ $1 = dark ]]
then
kvantummanager --set $KVANTUM_THEME_DARK
cp -rfv $GTK_THEME_PATH_DARK/gtk-4.0 $HOME/.config/
else
kvantummanager --set $KVANTUM_THEME_LIGHT
cp -rfv $GTK_THEME_PATH_LIGHT/gtk-4.0 $HOME/.config/
fi