#! /bin/bash

if [[ $1 == enable ]]; then
	gnome-extensions enable caffeine@patapon.info
else
gnome-extensions disable caffeine@patapon.info
fi
