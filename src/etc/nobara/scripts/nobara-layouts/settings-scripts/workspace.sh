#! /bin/bash

if [[ $1 == enable ]]; then
	gnome-extensions enable auto-move-windows@gnome-shell-extensions.gcampax.github.com
else
gnome-extensions disable auto-move-windows@gnome-shell-extensions.gcampax.github.com
fi
