setxkbmap -layout pt -option caps:escape &
xmodmap -e "clear lock"
xmodmap -e "keycode 9 = Caps_Lock NoSymbol Caps_Lock"
xmodmap -e "keycode 66 = Escape NoSymbol Escape"
numlockx &
while true; do wallpaper ; sleep 15m; done &
xrdb ~/.Xresources
my-lock-script
espanso -v worker & disown
sxhkd &>/dev/null & disown
pactl set-source-volume @DEFAULT_SOURCE@ 60000 & disown
exec i3
