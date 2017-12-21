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

export QT_QPA_PLATFORMTHEME=gtk2
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export QT_STYLE_OVERRIDE=gtk2
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK
export TERMINAL=xiatec
#/extra/home/.config/mopidy/mpd &

#init
#xrandr --output HDMI3 --primary --right-of HDMI1 &
#compton -bc &
#numlockx &

#daemons
# ~/.config/i3/wallswitch.sh
# ~/.config/i3/lock.sh &
# aria2c --enable-rpc --rpc-allow-origin-all --rpc-listen-all=true -l ~/.aria2c.log --quiet &
# x11vnc -quiet -display :0 -forever -usepw &
# xiate &
# export TERMINAL=xiatec &
# #urxvtd &
# #MPD_HOST=/extra/home/.config/mpd/socket mpDris2  &
# thunar --daemon &

#programs
#cmst &
#keepassxc &
#telegram-desktop &
#lsi-steam &
#dropbox &

#xorg
#(sleep 1 ; polybar -r rome) &
~/.config/i3/wallswitch.sh
/usr/lib/xfce-polkit/xfce-polkit &
udiskie -2 -s &
#~/xsleep.sh
exec i3

