"inoremap { {}<Esc>i
"inoremap ( ()<Esc>i
inoremap <C-v> <ESC>"+pa
vnoremap <Shift-f> NERDTreeFocus
vnoremap <C-c> "+y
vnoremap <C-Shift-c> gg"*yG
vnoremap <C-x> "+d
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
