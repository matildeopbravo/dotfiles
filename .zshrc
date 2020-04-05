# If you come from bash you might have to change your $PATH.
# Path to your oh-my-zsh installation.

export ZSH="/home/bravo/.oh-my-zsh"

ZSH_THEME="af-magic"
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
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

alias {vim,v}='nvim'; 
alias :r='source ~/.zshrc '
alias rbt='reboot'
alias c='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias d='cd ~/Desktop'
alias op='xdg-open' 
alias r='ranger'
alias dec='sudo light -U 10'
alias inc='sudo light -A 10'
#alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/.git'

source $ZSH/oh-my-zsh.sh

