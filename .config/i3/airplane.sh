#!/bin/bash
if !(rfkill -n | grep " blocked"); then
	sudo rfkill block all
else
	sudo rfkill unblock all
fi
