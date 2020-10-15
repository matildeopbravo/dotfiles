setxkbmap -layout pt -option caps:escape &
xmodmap -e "clear lock"
xmodmap -e "keycode 9 = Caps_Lock NoSymbol Caps_Lock"
xmodmap -e "keycode 66 = Escape NoSymbol Escape"
xrdb ~/.Xresources
my-lock-script
sxhkd & disown
exec i3 > ~/lmao
