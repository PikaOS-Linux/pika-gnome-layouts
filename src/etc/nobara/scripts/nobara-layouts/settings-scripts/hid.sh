#! /bin/bash

if [[ $1 == enable ]]; then
	gnome-extensions enable wireless-hid@chlumskyvaclav.gmail.com
else
gnome-extensions disable wireless-hid@chlumskyvaclav.gmail.com
fi
