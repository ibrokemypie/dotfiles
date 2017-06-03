#!/bin/bash
## counts number of connected displays then tells nitrogen to
## set wallpaper on each until all are done


i=$(xrandr -d :0 -q | grep ' connected' | wc -l)

while [[ $i > 0 ]]

do
	i=$[$i-1]
	nitrogen --random --set-zoom-fill --head=$i
done
