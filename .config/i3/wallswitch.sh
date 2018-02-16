#!/bin/bash
cmd(){
	#for pid in $(pidof -x wallswitch.sh); do
	#    if [ $pid != $$ ]; then
	#        kill -9 $pid
	#    fi 
	#done
	wal -i ~/Pictures/Desktop/ -t -o ~/.config/i3/dunstc.sh
	#wallsplash -r
}

rotate(){
	cmd
	sleep 900
	rotate
}

if [ ! -z "$1" ]
	then
		echo $1
		$1
else
	rotate &
fi
