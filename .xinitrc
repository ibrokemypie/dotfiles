#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?* ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

#mpd &
~/xiate/xiate &
mpDris2 &
dunst &
~/.config/i3/lock.sh &
compton &
xrandr --output HDMI3 --primary --left-of HDMI1 &
~/.config/i3/wallswitch.sh &
keepassxc &
aria2c --enable-rpc --rpc-allow-origin-all --rpc-listen-all=true &
x0vncserver -display :0 -passwordfile ~/.vnc/passwd &
export QT_QPA_PLATFORMTHEME=qt5ct
exec i3
