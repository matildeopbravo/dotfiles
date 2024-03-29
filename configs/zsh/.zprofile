neofetch
export PATH=$PATH:$HOME/scripts:$HOME/scripts/lock:$HOME/.local/bin:$HOME/.cargo/bin
export DOTFILES=$HOME/dotfiles
export WALLPAPERS=$HOME/Pictures/Wallpapers
export CURRENT_WALL=$WALLPAPERS/current_wallpaper
export ZSHDIR=$DOTFILES/configs/zsh
export TERMINAL=alacritty
export BROWSER="firefox"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export KEYTIMEOUT=1
export EDITOR=nvim
export VISUAL=nvim
export EXA_COLORS="*.mkv=36:*.mp3=36:*.mp4=36:*.aac=36:*.pdf=34:*.png=33:*.jpeg=33:*.jpg=33:*.o=10:*.c=36"
export MANPAGER="less -isg"
export LESS_TERMCAP_mb=$'\e[1;35m'
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;32m'
TZ='Europe/Lisbon'; export TZ


if [ "$(tty)" = "/dev/tty1" ]; then
    pgrep i3 || startx
fi
