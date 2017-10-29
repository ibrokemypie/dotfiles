#!/bin/bash
cmd(){
	wal -i ~/Pictures/Desktop -t -o ~/.config/i3/dunstc.sh
	#cmd="feh --bg-fill --recursive --random ~/Pictures/Desktop"
}

rotate(){
	while sleep 900
		do cmd
	done
}
cmd
rotate &
