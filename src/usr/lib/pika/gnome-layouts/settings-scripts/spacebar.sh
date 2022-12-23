#! /bin/bash

# Get needed extensions into userland

if [[ $1 == enable ]]; then
	gnome-extensions enable space-bar@luchrioh
else
gnome-extensions disable space-bar@luchrioh
fi
