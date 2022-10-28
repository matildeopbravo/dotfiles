setxkbmap -layout pt -option caps:escape &
xmodmap -e "clear lock"
xmodmap -e "keycode 9 = Caps_Lock NoSymbol Caps_Lock"
xmodmap -e "keycode 66 = Escape NoSymbol Escape"
while true; do wallpaper ; sleep 15m; done &
if [ -d "/sys/class/power_supply"  ]; then
    my-lock-script
else
    xrandr --output DP1 --right-of HDMI1
fi

rdb ~/.Xresources
sxhkd &>/dev/null & disown
exec i3
