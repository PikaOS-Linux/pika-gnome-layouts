#! /bin/bash

if [[ $1 == enable ]]; then
	gnome-extensions enable supergfxctl-gex@asus-linux.org
else
gnome-extensions disable supergfxctl-gex@asus-linux.org
fi
