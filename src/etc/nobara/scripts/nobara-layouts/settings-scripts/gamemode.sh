#! /bin/bash

if [[ $1 == enable ]]; then
	gnome-extensions enable gamemode@christian.kellner.me
else
gnome-extensions disable gamemode@christian.kellner.me
fi
