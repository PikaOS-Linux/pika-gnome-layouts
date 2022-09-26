#! /bin/bash

if [[ $1 == enable ]]; then
	gnome-extensions enable volume-mixer@evermiss.net
	gnome-extensions enable sound-output-device-chooser@kgshank.net
else
gnome-extensions disable volume-mixer@evermiss.net
gnome-extensions disable sound-output-device-chooser@kgshank.net
fi
