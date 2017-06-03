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

 xbindkeys -p
 ~/lock.sh &
# ~/.screenlayout/layout.sh &
# nitrogen --restore &
 plank &
# obmenu-generator -p &
# thunar --daemon &
# polybar top &
# nm-applet &
# sxhkd &
 keepassxc &
 compton &
# albert &
# #steam &
# telegram-desktop &
# exec openbox-session
exec i3
