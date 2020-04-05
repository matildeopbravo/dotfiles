neofetch

export PATH=$PATH:$HOME/.local/scripts
export ZSH="$HOME/.oh-my-zsh"
export TERMINAL=termite
export BROWSER="firefox"

 if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
else
export EDITOR='nvim'
fi

if [ "$(tty)" = "/dev/tty1" ]; then
    pgrep i3 || startx
fi



