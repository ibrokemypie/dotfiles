#!/bin/sh

xautolock -detectsleep -time 15 \
  -notify 30 \
  -notifier "notify-send -u critical -t 10000 -- 'LOCKING screen in 30 seconds'" \
  -locker "~/betterlockscreen"
  #-locker "light-locker-command -l" 
