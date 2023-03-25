#! /bin/bash
for ext in $(gnome-extensions list); do
    gnome-extensions reset $ext;
    gnome-extensions disable $ext;
done
gnome-extensions enable pika-darkmode@pika.com
gnome-extensions enable ubuntu-appindicators@ubuntu.com
