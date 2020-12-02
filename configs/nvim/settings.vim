augroup auFileTypes
  autocmd!
  autocmd FileType markdown setlocal textwidth=80
augroup end

set termguicolors
filetype on
filetype plugin on

syntax on
colorscheme base16-gruvbox-dark-medium
set number
set relativenumber
set noshowmode
set expandtab
set shiftwidth=4
set cindent smarttab autoindent smartindent
set tabstop=4
set completeopt-=preview "make clang complete not preview and just complete
set splitbelow
set splitright

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags "autocomplete html
autocmd! BufWritePre * %s/\s\+$//e "clear trailing whitespace

set nuw=2 "width of the line number column

autocmd FileType make set noexpandtab

augroup Mkdir
  autocmd!
  autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END
