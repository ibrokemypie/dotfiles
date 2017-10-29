#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
until (pidof -x wallswitch.sh) && !(pidof -x polybar)
do
	sleep 1
done

# Launch bar1 and bar2
polybar -r rome &

echo "Bars launched..."
