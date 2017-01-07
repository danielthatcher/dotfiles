#!/bin/sh

tid=$(xdotool getactivewindow)
xdotool windowactivate $(xdotool search --name burp | tail -n1)
sleep 0.1
xdotool key $*
xdotool windowactivate $tid
