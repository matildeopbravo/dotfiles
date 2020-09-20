neofetch

export PATH=$PATH:$HOME/scripts:$HOME/scripts/lock
export DOTFILES=$HOME/dotfiles
export ZSHDIR=$DOTFILES/zsh
export TERMINAL=alacritty
export BROWSER="firefox-developer-edition"
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

if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

if [ "$(tty)" = "/dev/tty1" ]; then
    pgrep i3 || startx
fi



