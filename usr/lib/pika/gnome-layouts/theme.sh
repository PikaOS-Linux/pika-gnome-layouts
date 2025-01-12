#! /bin/bash
rm -rfv $HOME/.config/gtk-4.0

if [[ $1 == pika ]]
then
dconf write /org/pika/layouts/pika-theme 1
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
dconf write /org/gnome/desktop/wm/preferences/titlebar-font "'Ubuntu Bold 11'"
dconf write /org/gnome/desktop/sound/theme-name "'pika'"
dconf write /org/gnome/desktop/interface/icon-theme "'Papirus'"
dconf write /org/gnome/desktop/interface/monospace-font-name "'Ubuntu Mono 13'"
dconf write /org/gnome/desktop/interface/document-font-name "'Sans 11'"
dconf write /org/gnome/desktop/interface/font-name "'Ubuntu 11'"
dconf write /org/gnome/desktop/interface/gtk-theme "'Jasper-Yellow-Dark'"
dconf write /org/gnome/shell/extensions/user-theme/name "'Jasper-Yellow-Dark'"
echo '#! /bin/bash' > $HOME/.config/pika_theme || touch $HOME/.config/pika_theme && echo '#! /bin/bash' > $HOME/.config/pika_theme
echo 'KVANTUM_THEME_DARK=Orchis-dark#' >> $HOME/.config/pika_theme
echo 'KVANTUM_THEME_LIGHT=Orchis#' >> $HOME/.config/pika_theme
echo 'GTK_THEME_DARK=$(dconf read /org/gnome/desktop/interface/gtk-theme | 'sed \"s+\'++\"' | 'sed \"s+\'++\"' | 'sed \"s+-Dark++\"' | 'sed \"s+-Light++\"')'-Dark >> $HOME/.config/pika_theme
echo 'GTK_THEME_LIGHT=$(dconf read /org/gnome/desktop/interface/gtk-theme | 'sed \"s+\'++\"' | 'sed \"s+\'++\"' | 'sed \"s+-Dark++\"' | 'sed \"s+-Light++\"')'-Light >> $HOME/.config/pika_theme
echo 'GTK_THEME_PATH_DARK=/usr/share/themes/$GTK_THEME_DARK' >> $HOME/.config/pika_theme
echo 'GTK_THEME_PATH_LIGHT=/usr/share/themes/GTK_THEME_LIGHT' >> $HOME/.config/pika_theme
dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
pika-gnome-theme dark
pkexec /usr/lib/pika/gnome-layouts/papirus-folders -u -C yellow
  if dconf read /org/gnome/desktop/interface/color-scheme | grep dark
  then
    pika-gnome-theme dark
  else
    pika-gnome-theme
  fi
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
echo '#! /bin/bash' > $HOME/.config/pika_theme || touch $HOME/.config/pika_theme && echo '#! /bin/bash' > $HOME/.config/pika_theme
echo 'KVANTUM_THEME_DARK=' >> $HOME/.config/pika_theme
echo 'KVANTUM_THEME_LIGHT=' >> $HOME/.config/pika_theme
echo 'GTK_THEME_DARK=' >> $HOME/.config/pika_theme
echo 'GTK_THEME_LIGHT=' >> $HOME/.config/pika_theme
echo 'GTK_THEME_PATH_DARK=' >> $HOME/.config/pika_theme
echo 'GTK_THEME_PATH_LIGHT=' >> $HOME/.config/pika_theme
fi
