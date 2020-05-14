source ~/.zplug/init.zsh
#autoload -U colors && colors 
setopt PROMPT_SUBST
export PROMPT='
 %{$fg[green]%}%~%{$reset_color%}$(gitprompt)%{$fg[blue]%} λ %{$reset_color%}'

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history 
setopt appendhistory     #Append history to the history file (no overwriting)
setopt sharehistory      #Share history across terminals
setopt incappendhistory  #Immediately append to the history file, not just when a term is killed

bindkey "^?" backward-delete-char # fixes problem in vi mode when you  want to delete using backspace after leaving normal mode

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
alias d='cd ~/.dotfiles'
alias mv='mv -i'
alias kill='kill -9'
alias r='ranger'
alias dec='sudo light -U 10'
alias inc='sudo light -A 10'
alias calc='clac'
alias vpnuminho='sudo openconnect -q -u $SMAIL --protocol=anyconnect https://vpn.uminho.pt'
alias minecraft='prime-run java -jar /opt/tlauncher/tlauncher.jar'
alias lightkeys='sudo chown $USER:$USER /sys/class/backlight/intel_backlight/brightness'
alias layout='. ~/.dotfiles/scripts/layout'
alias suspend='systemctl suspend'
alias t='termite -d $PWD & disown'
alias ka='killall'
alias :q='exit'
alias py='python'

function op () {
    xdg-open "$@" & disown 
    if test -f "$1"; then
        exit
    fi
}
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none
#function mpv () {
#    mpv --geometry=1200x700 "$1" 
#    exit
#}
#alias mpvn='mpv --no-video'
#alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/.git'
source /home/bravo/.local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
