#! /usr/bin/bash
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
if [[ $1 == Teal ]]
then
	if dconf read /org/gnome/desktop/interface/color-scheme | grep dark
	then
		gdbus call --session --dest 'org.gnome.Shell' --object-path '/org/gnome/Shell' --method 'org.gnome.Shell.ScreenTransition' & gsettings set org.gnome.shell.extensions.user-theme name "Jasper-Dark" && gsettings set org.gnome.desktop.interface gtk-theme "Jasper-Dark" && cp -rfv "/usr/share/themes/Jasper-Dark"/gtk-4.0 "$HOME"/.config/

	else
		gdbus call --session --dest 'org.gnome.Shell' --object-path '/org/gnome/Shell' --method 'org.gnome.Shell.ScreenTransition' & gsettings set org.gnome.shell.extensions.user-theme name "Jasper-Light" && gsettings set org.gnome.desktop.interface gtk-theme "Jasper-Light" && cp -rfv "/usr/share/themes/Jasper-Light"/gtk-4.0 "$HOME"/.config/
	fi
else
	if dconf read /org/gnome/desktop/interface/color-scheme | grep dark
	then
		gdbus call --session --dest 'org.gnome.Shell' --object-path '/org/gnome/Shell' --method 'org.gnome.Shell.ScreenTransition' & gsettings set org.gnome.shell.extensions.user-theme name "Jasper-$1-Dark" && gsettings set org.gnome.desktop.interface gtk-theme "Jasper-$1-Dark" && cp -rfv "/usr/share/themes/Jasper-$1-Dark"/gtk-4.0 "$HOME"/.config/
	else
		gdbus call --session --dest 'org.gnome.Shell' --object-path '/org/gnome/Shell' --method 'org.gnome.Shell.ScreenTransition' & gsettings set org.gnome.shell.extensions.user-theme name "Jasper-$1-Light" && gsettings set org.gnome.desktop.interface gtk-theme "Jasper-$1-Light" && cp -rfv "/usr/share/themes/Jasper-$1-Light"/gtk-4.0 "$HOME"/.config/
	fi
fi
