#! /bin/bash
for ext in $(gnome-extensions list); do
    gnome-extensions reset $ext;
    gnome-extensions disable $ext;
done
