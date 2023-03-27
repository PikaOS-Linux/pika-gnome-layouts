#! /usr/bin/bash
gnome-extensions enable pika-darkmode@pika.com
dconf write /org/gnome/shell/extensions/nightthemeswitcher/time/manual-time-source true
dconf write /org/gnome/shell/extensions/nightthemeswitcher/time/ondemand-button-placement "'none'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/time/ondemand-time "'night'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/time/time-source "'ondemand'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/gtk-variants/enabled true
dconf write /org/gnome/shell/extensions/nightthemeswitcher/shell-variants/enabled true
dconf write /org/pika/layouts/pika-theme 1
dconf write /org/gnome/shell/extensions/nightthemeswitcher/commands/enabled true
dconf write /org/gnome/shell/extensions/nightthemeswitcher/commands/sunrise "'/usr/lib/pika/gnome-layouts/libadwaita.sh'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/commands/sunset "'/usr/lib/pika/gnome-layouts/libadwaita.sh dark'"
if [[ $1 == Blue ]]
then
dconf write /org/gnome/shell/extensions/nightthemeswitcher/gtk-variants/day "'Orchis-Light'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/gtk-variants/night "'Orchis-Dark'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/shell-variants/day "'Orchis-Light'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/shell-variants/night "'Orchis-Dark'"
else
dconf write /org/gnome/shell/extensions/nightthemeswitcher/gtk-variants/day "'Orchis-$1-Light'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/gtk-variants/night "'Orchis-$1-Dark'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/shell-variants/day "'Orchis-$1-Light'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/shell-variants/night "'Orchis-$1-Dark'"
fi
if dconf read /org/gnome/desktop/interface/color-scheme | grep dark
then
/usr/lib/pika/gnome-layouts/libadwaita.sh dark
else
/usr/lib/pika/gnome-layouts/libadwaita.sh
fi