#!/usr/bin/env sh

waitr(){
# Wait until the processes have been shut down
if (xrdb -query | grep color15) && !(pidof -x polybar)
	then
		for i in $(polybar -m | awk -F: '{print $1}'); do MONITOR=$i polybar rome -c ~/.config/polybar/config & done
else
	sleep .5
	waitr
fi
}


# Terminate already running bar instances
if (pidof -x polybar)
then
	killall -q polybar
	echo "killed polybar"
fi

waitr
