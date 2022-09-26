#! /bin/bash

if [[ $1 == enable ]]; then
	gnome-extensions enable blur-my-shell@aunetx
else
gnome-extensions disable blur-my-shell@aunetx
fi
