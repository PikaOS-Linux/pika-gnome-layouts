#! /bin/bash

if [[ $1 == enable ]]; then
	gnome-extensions enable gestureImprovements@gestures
else
gnome-extensions disable gestureImprovements@gestures
fi
