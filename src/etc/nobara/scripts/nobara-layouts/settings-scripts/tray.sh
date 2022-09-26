#! /bin/bash

# Get needed extensions into userland


if [[ $1 == enable ]]; then
	gnome-extensions enable appindicatorsupport@rgcjonas.gmail.com
else
gnome-extensions disable appindicatorsupport@rgcjonas.gmail.com
fi
