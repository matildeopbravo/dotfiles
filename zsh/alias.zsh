if hash exa &>/dev/null
then
    alias ls='exa' 
    alias l='exa -lsnew -a'
    alias ll='exa -lsnew'
    alias tree='exa -T'
else
    alias ls='ls --color=auto'
fi

#config files
alias d='$DOTFILES'
alias ds='$DOTFILES/scripts'
alias 3='v $DOTFILES/i3/config'
alias zshrc='v $ZSHDIR/.zshrc'
alias zalias='v $ZSHDIR/alias.zsh'
alias zprofile='v $ZSHDIR/.zprofile'

alias cat='bat'
alias {vim,v}='nvim'; 
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -Iv'
alias ..='cd ..'
alias ...='cd ../..'
alias diff="diff --color=auto"
alias :r='source ~/.zshrc '
alias c='clear'
alias :q='exit'
alias kill='kill -9'
alias r='ranger'
alias z='zathura'
alias py='python'
alias fzf="fzf --preview-window=right:60% --preview='bat --color "always" {}' | xclip"
alias vf='vim `f`'
alias vpnuminho='sudo openconnect -q -u $SMAIL --protocol=anyconnect https://vpn.uminho.pt'
alias minecraft='prime-run java -jar /opt/tlauncher/tlauncher.jar'
alias lightkeys='sudo chown $USER:$USER /sys/class/backlight/intel_backlight/brightness'
alias susp='systemctl suspend'
alias rbt='reboot'
alias ka='killall'
alias weather="curl 'wttr.in/~'${1:-Braga}'+'$2'?'${3:-0}"


#git alias
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -m'
alias gca='git commit -a -m'
alias gd='git diff'
alias gf='git fetch'
alias grhh='git reset --hard'
alias grc='git rm -rf --cached'
alias gp='git push'
alias gl='git pull'
alias gst='git status'
