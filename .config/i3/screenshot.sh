#!/bin/bash
while test $# -gt 0; do
        case "$1" in
                -h|--help)
                        echo "$package - attempt to capture frames"
                        echo " "
                        echo "screenshot [-option]"
                        echo " "
                        echo "options:"
                        echo "-h, --help                show brief help"
                        echo "-c       					Copy image to clipboard"
                        echo "-s       					Select area to grab"
                        exit 0
                        ;;
                -c)
                        shift
	 					export CLIP=1
                        shift
                        ;;
                -s)
                        shift
                        export SELECT=1
                        shift
                        ;;
                -sc|-cs)
                        shift
                        export CLIP=1
                        export SELECT=1
                        shift
                        ;;
                *)
                        break
                        ;;
        esac
done
if [[ $SELECT == 1 ]]; then
	if [[ $CLIP == 1 ]]; then
		maim -s | xclip -selection clipboard -t image/png
	else
		maim -s ~/Pictures/$(date +%s).png
	fi
else
	if [[ $CLIP == 1 ]]; then
		maim | xclip -selection clipboard -t image/png
	else
		maim ~/Pictures/$(date +%s).png
	fi
fi
