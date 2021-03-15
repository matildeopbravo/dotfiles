augroup auFileTypes
  autocmd!
  autocmd FileType markdown setlocal textwidth=80
augroup end
  autocmd FileType json syntax match Comment +\/\/.\+$+

set termguicolors
filetype on
filetype plugin indent on

syntax enable
colorscheme deus
set colorcolumn=80
set number relativenumber
set noshowmode
set expandtab
set shiftwidth=4
set cindent smarttab autoindent smartindent
set tabstop=4
set ignorecase smartcase
set completeopt-=preview "make clang complete not preview and just complete
set splitbelow splitright
set autochdir
set icm=nosplit

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType c ClangFormatAutoEnable
au BufRead,BufNewFile * setlocal textwidth=80
autocmd! BufNewFile,BufRead,BufReadPre,BufWritePost *.h set filetype=c
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags "autocomplete html
autocmd! BufWritePre * %s/\s\+$//e "clear trailing whitespace

autocmd Filetype markdown colorscheme base16-gruvbox-dark-medium

set nuw=2 "width of the line number column

autocmd FileType make set noexpandtab

command Json set syntax=json

augroup Mkdir
  autocmd!
  autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END
