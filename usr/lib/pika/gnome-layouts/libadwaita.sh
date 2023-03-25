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
    then
        if [[ $1 = dark ]]
        then
            kvantummanager --set $(cat $HOME/.config/pika_theme | grep 'KVANTUM_THEME_DARK=' | head -n1 | sed "s#KVANTUM_THEME_DARK=##")
            cp -rfv $(cat $HOME/.config/pika_theme | grep 'GTK_THEME_PATH_DARK=' | head -n1 | sed "s#GTK_THEME_PATH_DARK=##")/gtk-4.0 $HOME/.config/
        else
            kvantummanager --set $(cat $HOME/.config/pika_theme | grep 'KVANTUM_THEME_LIGHT=' | head -n1 | sed "s#KVANTUM_THEME_LIGHT=##")
            cp -rfv $(cat $HOME/.config/pika_theme | grep 'GTK_THEME_PATH_LIGHT=' | head -n1 | sed "s#GTK_THEME_PATH_LIGHT=##")/gtk-4.0 $HOME/.config/
        fi
    fi
fi
