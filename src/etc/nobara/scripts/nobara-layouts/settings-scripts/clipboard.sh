#! /bin/bash

if [[ $1 == enable ]]; then
	gnome-extensions enable clipboard-history@alexsaveau.dev
	fi
else
gnome-extensions disable clipboard-history@alexsaveau.dev
fi
