#! /bin/bash

if [[ $1 == enable ]]; then
	gnome-extensions enable gnome-clipboard@b00f.github.io
	fi
else
gnome-extensions disable gnome-clipboard@b00f.github.io
fi
