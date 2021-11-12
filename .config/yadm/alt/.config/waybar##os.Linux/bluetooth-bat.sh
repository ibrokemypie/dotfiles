#! /bin/bash

if [[ "$1" == "toggle" ]]; then
    if [[ -f "/tmp/show_batteries" ]]; then
        rm "/tmp/show_batteries"
    else
        touch "/tmp/show_batteries"
    fi

    exit
fi

if [[ -f "/tmp/show_batteries" ]]; then
    devices=()
    readarray -t devices < <(upower -e)

    outputString=""

    for i in "${!devices[@]}"; do
        device="${devices[i]}"
        deviceUpowerOutput=$(upower -i "$device")

        grep -q "has history:\s*no" <<< "$deviceUpowerOutput" && continue

        devicePercentage=$(grep -oP "percentage:\s*\K.*" <<< "$deviceUpowerOutput")
        deviceName=$(grep -oP "model:\s*\K.*" <<< "$deviceUpowerOutput")

        icon="${deviceName:0:5}"
        if [[ "$deviceName" == "WH-1000XM3" ]]; then
            icon=""
        elif [[ "$deviceName" == "Gaming Mouse G900" ]]; then
            icon=""
        elif [[ "$deviceName" == "Wireless Controller" ]]; then
            icon=""
        fi

        outputString="$outputString$icon:$devicePercentage "
    done

    echo "$outputString" | xargs
else
    echo ""
fi