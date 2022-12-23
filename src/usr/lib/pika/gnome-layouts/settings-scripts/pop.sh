#! /bin/bash

if [[ $1 == enable ]]; then
	gnome-extensions enable pop-shell@system76.com
else
gnome-extensions disable pop-shell@system76.com
fi
