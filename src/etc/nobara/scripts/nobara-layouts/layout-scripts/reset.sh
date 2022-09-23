#! /bin/bash
for ext in $(/usr/bin/ls ~/.local/share/gnome-shell/extensions); do
    gnome-extensions reset $ext;
    gnome-extensions disable $ext;
done
