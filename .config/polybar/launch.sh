#!/usr/bin/env sh

waitr(){
# Wait until the processes have been shut down
if (xrdb -query | grep color15) && !(pidof -x polybar)
	then
		polybar -r rome
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
