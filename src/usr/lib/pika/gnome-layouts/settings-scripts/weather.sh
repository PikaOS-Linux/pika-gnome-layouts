#! /bin/bash

if [[ $1 == enable ]]; then
	gnome-extensions enable openweather-extension@jenslody.de
else
gnome-extensions disable openweather-extension@jenslody.de
fi
