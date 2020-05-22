if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))

    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins 

call plug#begin(stdpath('data') . '/plugged')

Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'cohama/lexima.vim'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-clang'
"themes
Plug 'joshdick/onedark.vim' 
Plug 'arcticicestudio/nord-vim'
Plug 'ntk148v/vim-horizon'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#clang_complete_database = 1

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

let g:onedark_termcolors=256
let g:onedark_terminal_italics=1

let g:gruvbox_contrast_dark='soft'

let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let airline#extensions#tabline#tabs_label = ''
let airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#fnamemod = ':t'

let g:deoplete#enable_at_startup = 1

