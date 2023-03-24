#! /bin/bash
gnome-extensions enable pika-darkmode@pika.com
dconf write /org/gnome/shell/extensions/nightthemeswitcher/time/manual-time-source true
dconf write /org/gnome/shell/extensions/nightthemeswitcher/time/ondemand-button-placement "'none'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/time/ondemand-time "'night'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/time/time-source "'ondemand'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/gtk-variants/enabled true
dconf write /org/gnome/shell/extensions/nightthemeswitcher/shell-variants/enabled true

if [[ $1 == pika ]]
then
dconf write /org/pika/layouts/pika-theme 1
dconf write /org/gnome/desktop/wm/preferences/titlebar-font "'Fira Sans Semi-Bold 10'"
dconf write /org/gnome/desktop/sound/theme-name "'pika'"
dconf write /org/gnome/desktop/interface/icon-theme "'Papirus'"
dconf write /org/gnome/desktop/interface/monospace-font-name "'Fira Mono 11'"
dconf write /org/gnome/desktop/interface/document-font-name "'Roboto Slab 11'"
dconf write /org/gnome/desktop/interface/font-name "'Fira Sans Semi-Light 10'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/commands/enabled true
dconf write /org/gnome/shell/extensions/nightthemeswitcher/commands/sunrise "'/usr/lib/pika/gnome-layouts/libadwaita.sh'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/commands/sunset "'/usr/lib/pika/gnome-layouts/libadwaita.sh dark'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/gtk-variants/day "'Orchis-Yellow-Light'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/gtk-variants/night "'Orchis-Yellow-Dark'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/shell-variants/day "'Orchis-Yellow-Light'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/shell-variants/night "'Orchis-Yellow-Dark'"
fi
if [[ $1 == gnome ]]
then
dconf write /org/pika/layouts/pika-theme 0
dconf write /org/gnome/shell/extensions/user-theme/name "''"
dconf write /org/gnome/desktop/wm/preferences/titlebar-font "'Cantarell Bold 11'"
dconf write /org/gnome/desktop/sound/theme-name "'freedesktop'"
dconf write /org/gnome/desktop/interface/icon-theme "'Adwaita'"
dconf write /org/gnome/desktop/interface/monospace-font-name "'Monospace 11'"
dconf write /org/gnome/desktop/interface/document-font-name "'Sans 11'"
dconf write /org/gnome/desktop/interface/font-name "'Cantarell 11'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/commands/enabled false
dconf write /org/gnome/shell/extensions/nightthemeswitcher/gtk-variants/day "'adw-gtk3'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/gtk-variants/night "'adw-gtk3-dark'"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/shell-variants/day "''"
dconf write /org/gnome/shell/extensions/nightthemeswitcher/shell-variants/night "''"
fi
