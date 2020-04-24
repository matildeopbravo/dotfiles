# If you come from bash you might have to change your $PATH.  Path to your oh-my-zsh installation.

ZSH_THEME="af-magic"
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
#DISABLE_LS_COLORS="true"
# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

plugins=(git colored-man-pages zsh-syntax-highlighting) 


source $ZSH/oh-my-zsh.sh

if hash exa &>/dev/null
then
    alias ls='exa' 
    alias l='ls -lsnew'
    alias ll='ls -la'
    alias tree='exa -T'
    alias lsnew='exa -lsnew'

else
    alias ls='ls --color=auto'
fi
alias cat='bat'
alias {vim,v}='nvim'; 
alias :r='source ~/.zshrc '
alias rbt='reboot'
alias c='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias d='cd ~/Desktop'
alias mv='mv -i'
alias kill='kill -9'
alias r='ranger'
alias dec='sudo light -U 10'
alias inc='sudo light -A 10'
alias calc='clac'
alias vpnuminho="sudo openconnect -q -u $SMAIL --protocol=anyconnect https://vpn.uminho.pt "
alias minecraft="prime-run java -jar /opt/tlauncher/tlauncher.jar"
alias lightkeys="sudo chown $USER:$USER /sys/class/backlight/intel_backlight/brightness"
alias layout=". ~/.dotfiles/scripts/layout"
alias suspend='systemctl suspend'
    
function op () {
    xdg-open "$@" & disown 
    if test -f "$1"; then
        exit
    fi
}

#alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/.git'

