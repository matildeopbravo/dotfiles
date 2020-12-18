if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))

    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins

call plug#begin(stdpath('data') . '/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'cohama/lexima.vim'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'godlygeek/tabular'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-clang'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'dkarter/bullets.vim'
Plug 'chrisbra/unicode.vim'
Plug 'itspriddle/vim-shellcheck'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-surround'
"themes
Plug 'tomasiser/vim-code-dark'
Plug 'wadackel/vim-dogrun'
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'ntk148v/vim-horizon'
Plug 'morhetz/gruvbox'
Plug 'phanviet/vim-monokai-pro'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'chriskempson/base16-vim'

call plug#end()

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#clang_complete_database = 1
let g:ale_c_clang_options = '-x c'
let g:ale_c_clangtidy_options = '-x c'
let g:ale_echo_msg_format = '%linter%: %s'
let g:ale_linters = {
    \ 'rust' : ['analyzer'],
    \ 'c': ['ccls', 'clangtidy', 'clangcheck'],
    \ 'cpp': ['ccls','g++','clangtidy','clang++'],
    \ 'tex': ['alex', 'chktex', 'proselint', 'redpen',
    \         'texlab', 'textlint', 'vale', 'writegood']
    \ }

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
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

let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" Bullets.vim
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '>>'
let b:ale_enabled = 1
