#!/bin/zsh

# Specifying the icon(s) in the script
# This allows us to change its appearance conditionally
icon="bleh"

players=$(playerctl -l)

for player in $players; do
	p_status=$(playerctl -p $p status 2> /dev/null)
	if [ $p_status != "Stopped" ]; then
		player_status=$p_status
		goodplayer=$p
	fi
done
echo $player_status
echo $goodplayer

if [[ $? -eq 0 ]]; then
    metadata="$(playerctl -p $goodplayer metadata artist) - $(playerctl -p $goodplayer metadata title)"
fi

# Foreground color formatting tags are optional
if [[ $player_status = "Playing" ]]; then
    echo "%{F#D08770}$icon $metadata"       # Orange when playing
elif [[ $player_status = "Paused" ]]; then
    echo "%{F#65737E}$icon $metadata"       # Greyed out info when paused
else
    echo "%{F#65737E}$icon"                 # Greyed out icon when stopped
fi
