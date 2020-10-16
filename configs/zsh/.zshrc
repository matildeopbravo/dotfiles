source $ZSHDIR/alias.zsh
source $ZSHDIR/functions.zsh
source ~/.local/share/zplug/init.zsh

autoload -U colors && colors 
#autoload -Uz compinit

setopt autocd
unsetopt nomatch #if there is no match using globs, it is not expanded

#zstyle :compinstall filename "~/.zshrc"
zstyle ':completion:*' menu select # highlights options of completion 

#compinit

#Prompt
setopt PROMPT_SUBST
export PROMPT=' %{$fg[green]%}%~%{$reset_color%}$(gitprompt)%{$fg[blue]%} λ %{$reset_color%}'

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.local/cached/.zsh_history 
setopt appendhistory     #Append history to the history file (no overwriting)
setopt sharehistory      #Share history across terminals
setopt incappendhistory  #Immediately append to the history file, not just when a term is killed


bindkey "^?" backward-delete-char # fixes problem in vi mode when you  want to delete using backspace after leaving normal mode
bindkey -v # use vi mode
bindkey '^R' history-incremental-search-backward
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

