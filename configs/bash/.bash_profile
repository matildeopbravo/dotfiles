# .bash_profile

# Get the aliases and functions
[ -f ~/.bashrc ] && . ~/.bashrc

# User specific environment and startup programs

export PATH=$PATH:$HOME/scripts:$HOME/.local/bin
export DOTFILES=$HOME/dotfiles
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


if [ -z "$TMUX" ]; then
    tmux attach -t default || tmux new -s default
fi

