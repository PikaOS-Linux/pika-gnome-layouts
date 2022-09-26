#! /bin/bash

if [[ $1 == enable ]]; then
	gnome-extensions enable clipboard-history@alexsaveau.dev
else
gnome-extensions disable clipboard-history@alexsaveau.dev
fi
