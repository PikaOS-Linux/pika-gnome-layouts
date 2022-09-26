#! /bin/bash

if [[ $1 == enable ]]; then
	gnome-extensions enable Vitals@CoreCoding.com
else
gnome-extensions disable Vitals@CoreCoding.com
fi
