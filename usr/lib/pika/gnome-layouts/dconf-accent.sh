#! /usr/bin/bash
gnome-extensions enable pika-darkmode@pika.com
dconf write /org/gnome/shell/extensions/nightthemeswitcher/time/manual-time-source true
dconf write /org/gnome/shell/extensions/nightthemeswitcher/time/ondemand-button-placement "'none'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/time/time-source "'ondemand'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/gtk-variants/enabled true
dconf write /org/gnome/shell/extensions/nightthemeswitcher/shell-variants/enabled true
dconf write /org/pika/layouts/pika-theme 1
dconf write /org/gnome/shell/extensions/nightthemeswitcher/commands/enabled true
dconf write /org/gnome/shell/extensions/nightthemeswitcher/commands/sunrise "'pika-gnome-theme'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/commands/sunset "'pika-gnome-theme dark'"
if [[ $1 == Blue ]]
then
dconf write /org/gnome/shell/extensions/nightthemeswitcher/gtk-variants/day "'Jasper-Light'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/gtk-variants/night "'Jasper-Dark'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/shell-variants/day "'Jasper-Light'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/shell-variants/night "'Jasper-Dark'"
else
dconf write /org/gnome/shell/extensions/nightthemeswitcher/gtk-variants/day "'Jasper-$1-Light'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/gtk-variants/night "'Jasper-$1-Dark'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/shell-variants/day "'Jasper-$1-Light'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/shell-variants/night "'Jasper-$1-Dark'"
fi
if dconf read /org/gnome/desktop/interface/color-scheme | grep dark
then
pika-gnome-theme dark
else
pika-gnome-theme
fi
