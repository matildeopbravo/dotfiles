neofetch

export PATH=$PATH:$HOME/.local/scripts
export ZSH="$HOME/.config/.oh-my-zsh"
export TERMINAL=termite
export 
export BROWSER="firefox-developer-edition"

 if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
else
export EDITOR='nvim'
fi

if [ "$(tty)" = "/dev/tty1" ]; then
    pgrep i3 || startx
fi



