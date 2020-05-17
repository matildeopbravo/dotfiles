
if hash exa &>/dev/null
then
    alias ls='exa' 
    alias l='exa -lsnew -la'
    alias ll='exa -lsnew'
    alias la='exa --sort=name -l'
    alias tree='exa -T'

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
alias d='$DOTFILES'
alias ds='$DOTILES/scripts'
alias 3='v $DOTFILES/i3/config'
alias zshrc='v $ZSHDIR/.zshrc'
alias zalias='v $ZSHDIR/alias.zsh'
alias zprofile='v $ZSHDIR/.zprofile'
alias mv='mv -i'
alias kill='kill -9'
alias r='ranger'
alias calc='clac'
alias vpnuminho='sudo openconnect -q -u $SMAIL --protocol=anyconnect https://vpn.uminho.pt'
alias minecraft='prime-run java -jar /opt/tlauncher/tlauncher.jar'
alias lightkeys='sudo chown $USER:$USER /sys/class/backlight/intel_backlight/brightness'
alias suspend='systemctl suspend'
alias ka='killall'
alias :q='exit'
alias py='python'

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

function op () {
    xdg-open "$@" & disown 
    if test -f "$1"; then
        exit
    fi
}

#function vid () {
#    mpv --geometry=1200x700 $1 #& disown 
    #if test -f "$1"; then
    #    exit
    #fi
#}

#alias mpvn='mpv --no-video'
ex() {
  if [ -f "$1" ] ; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"   ;;
      *.tar.gz)    tar xzf "$1"   ;;
      *.bz2)       bunzip2 -v "$1"   ;;
      *.rar)       unrar x "$1"   ;;
      *.gz)        gunzip "$1"    ;;
      *.tar)       tar xf "$1"    ;;
      *.tbz2)      tar xjf "$1"   ;;
      *.tgz)       tar xzf "$1"   ;;
      *.zip)       unzip "$1"     ;;
      *.Z)         uncompress "$1";;
      *.7z)        7z x "$1"      ;;
      *.xz)        xz -d "$1"     ;;
      *)           echo "$1 cannot be extracted via ex()" ;;
    esac
  else
    echo "$1 is not a valid file"
  fi
}

dual() {
    xrandr --output HDMI-1 --auto
    xrandr --output HDMI-1 --left-of eDP-1
    feh --bg-fill ~/Pictures/Wallpapers/blue-horizon.jpg
    picom -b --backend glx --experimental-backends & disown
    layout
    i3-msg "restart"
}

single() {
    xrandr --output HDMI-1 --off 
    feh --bg-fill $WALLPAPER

}

