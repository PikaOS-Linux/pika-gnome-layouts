#! /bin/bash

	if [[ "$RELOG_NEEDED" == 1 ]]; then
		if zenity --question --text="New extensions have been installed!, reload required!"
		then
		gnome-session-quit --force --no-prompt
		fi
	fi
