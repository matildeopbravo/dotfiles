#!/bin/bash

screen="HDMI-1"
rotate="normal"

xrandr | grep $screen | cut -d '(' -f1 | grep 'left' || rotate='left'
xrandr --output "$screen" --rotate "$rotate"
i3-msg restart
