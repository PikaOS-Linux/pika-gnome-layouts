#! /bin/bash
rm -rfv $HOME/.config/gtk-4.0
THEME=$(dconf read /org/gnome/desktop/interface/gtk-theme | sed "s+'++" | sed "s+'++" | sed "s+-Dark++" | sed "s+-Light++" )
if echo $THEME | grep -i orchis
    then
    if [[ $1 = dark ]]
    then
        kvantummanager --set Orchis-dark
        cp -rfv /usr/share/themes/$THEME-Dark/gtk-4.0 $HOME/.config/
    else
        kvantummanager --set Orchis
        cp -rfv /usr/share/themes/$THEME-Light/gtk-4.0 $HOME/.config/
    fi
else
    if [ -f  $HOME/.config/pika_theme ]
    . "$HOME/.config/pika_theme"
    then
        if [[ $1 = dark ]]
        then
            kvantummanager --set $KVANTUM_THEME_DARK
            cp -rfv $GTK_THEME_PATH_DARK/gtk-4.0 $HOME/.config/
        else
            kvantummanager --set $KVANTUM_THEME_LIGHT
            cp -rfv $GTK_THEME_PATH_LIGHT/gtk-4.0 $HOME/.config/
        fi
    fi
fi
