#! /bin/bash

if [[ $1 == enable ]]; then
	gnome-extensions enable ding@rastersoft.com
else
gnome-extensions disable ding@rastersoft.com
fi
