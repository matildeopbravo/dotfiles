source $DOTFILES/nvim/plugins.vim
source $DOTFILES/nvim/keybindings.vim

augroup auFileTypes
  autocmd!
  autocmd FileType markdown setlocal textwidth=80
augroup end

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
colorscheme gruvbox 
set number
set noshowmode
set expandtab
set shiftwidth=4
set cindent smarttab autoindent smartindent
set tabstop=4
set completeopt-=preview "make clang complete not preview and just complete

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

