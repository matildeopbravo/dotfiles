source $ZSHDIR/alias.zsh
source $ZSHDIR/functions.zsh
#source "$HOME/.local/share/zsh-vim-mode/zsh-vim-mode.plugin.zsh"

autoload -U colors && colors
autoload -Uz compinit

setopt extended_glob
unsetopt nomatch #if there is no match using globs, it is not expanded

zstyle :compinstall filename "~/.zshrc"
zstyle ':completion:*' menu select # highlights options of completion

compinit

#Prompt
setopt PROMPT_SUBST
#source /home/pasok/.rvm/scripts/rvm
source $DOTFILES/configs/zsh/themes/robbyrussell.zsh-theme
#export PROMPT=' %{$fg[green]%}%~%{$reset_color%}$(gitprompt)%{$fg[blue]%} λ %{$reset_color%}'

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/.zsh_history
unsetopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE # don't add commands prepended with a space to history
setopt appendhistory     #Append history to the history file (no overwriting)
setopt sharehistory      #Share history across terminals
setopt incappendhistory  #Immediately append to the history file, not just when a term is killed


bindkey "^?" backward-delete-char # fixes problem in vi mode when you  want to delete using backspace after leaving normal mode
bindkey -v # use vi mode
#bindkey '^R' history-incremental-search-backward
bindkey '^R' fzf-history
autoload edit-command-line; zle -N edit-command-line
bindkey '^x' edit-command-line
MODE_CURSOR_VIINS="#00FFFF bar"
MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady bar"
fzf-history() {
    cenas=$(history 0 | awk '{ $1=""; print}' | fzf --no-sort --tac --exact)
    echo -n "$cenas"
    eval $cenas
}
function Resume {
    fg
    zle push-input
    BUFFER=""
    zle accept-line
}
zle -N Resume
bindkey "^Z" Resume
zle -N fzf-history
clearing () { clear; echo ; zle redisplay}
zle -N clearing
bindkey "^L" clearing
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

function vi-yank-xclip {
    zle vi-yank
   echo "$CUTBUFFER" | xclip -selection clipboard
}
zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[6 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[6 q"
}
zle -N zle-line-init
echo -ne '\e[6 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[6 q' ;} # Use beam shape cursor for each new prompt.

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none
[ -f "/home/pasok/.ghcup/env" ] && source "/home/pasok/.ghcup/env" # ghcup-env

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
