#! /bin/bash

if [[ $1 == enable ]]; then
	gnome-extensions enable gsconnect@andyholmes.github.io
else
gnome-extensions disable gsconnect@andyholmes.github.io
fi
