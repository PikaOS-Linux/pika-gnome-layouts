#! /bin/bash

if [[ $1 == enable ]]; then
	gnome-extensions enable freon@UshakovVasilii_Github.yahoo.com
else
gnome-extensions disable freon@UshakovVasilii_Github.yahoo.com
fi
