setxkbmap -layout pt -option caps:escape &
xmodmap -e "clear lock"
xmodmap -e "keycode 9 = Caps_Lock NoSymbol Caps_Lock"
xmodmap -e "keycode 66 = Escape NoSymbol Escape"
numlockx &
while true; do wallpaper ; sleep 15m; done &
(sleep 1m ; while true; do crypto.sh ; sleep 1h; done) &
xrdb ~/.Xresources
my-lock-script
sxhkd &>/dev/null & disown
exec i3
