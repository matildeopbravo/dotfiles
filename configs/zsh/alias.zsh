if hash exa &>/dev/null
then
    alias ls='exa' 
    alias l='exa -lsnew'
    alias ll='exa -lsnew -a'
    alias tree='exa -T'
else
    alias ls='ls --color=auto'
fi

#config files
alias d='$DOTFILES'
alias ds='$DOTFILES/scripts'
alias 3='v $DOTFILES/configs/i3/config'
alias zshrc='v $ZSHDIR/.zshrc'
alias zalias='v $ZSHDIR/alias.zsh'
alias zprofile='v $ZSHDIR/.zprofile'
alias sxhkdrc='v $HOME/.config/sxhkd/sxhkdrc'
alias p='pacman'
alias cat='bat'

alias {vim,v}='nvim'; 
alias cp='cp -iv'
alias mv=' bash $DOTFILES/scripts/mv.sh' # my script which creates symlinks
alias rm='rm -Iv'
alias ..='cd ..'
alias ...='cd ../..'
alias diff="diff --color=auto"
alias :r='source ~/.zshrc '
alias c='clear ; echo'
alias :q='exit'
alias r='ranger'
alias z='zathura'
alias py='python'
alias s='sxiv'
alias vpnuminho='sudo openconnect -q -u $SMAIL --protocol=anyconnect https://vpn.uminho.pt'
alias minecraft='prime-run java -jar /opt/tlauncher/tlauncher.jar'
#alias lightkeys='sudo chown $USER:$USER /sys/class/backlight/intel_backlight/brightness'
alias susp='systemctl suspend'
alias rbt='reboot'
alias weather="curl 'wttr.in/~'${1:-Braga}'+'$2'?'${3:-0}"
alias esc='setxkbmap -layout pt -option escape:caps &'

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

