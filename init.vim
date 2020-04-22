 
" plugins 
call plug#begin(stdpath('data') . '/plugged')
Plug 'joshdick/onedark.vim' 
Plug 'ntk148v/vim-horizon'
Plug 'sheerun/vim-polyglot'
Plug 'octol/vim-cpp-enhanced-highlight'
call plug#end()

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:airline_powerline_fonts = 1

let g:airline_theme='onedark'
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1


if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
colorscheme onedark

set number
"set relativenumber
set noshowmode
set expandtab
set shiftwidth=4
set cindent smarttab autoindent smartindent
set tabstop=4


inoremap { {<CR><BS>}<Esc>ko
:inoremap ( ()<Esc>i
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-x> "+d

"au VimEnter * :silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
"au VimLeave * :silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
