
nmap <M-f> :NERDTreeToggle<CR>
vnoremap <C-c> "+y
map <F2> :w! <CR>
vnoremap <C-Shift-c> gg"*yG
vnoremap <C-J> <C-W><C-J>

"navigating split files
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>noremap <C-x> "+d

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"inoremap { {}<Esc>i
"inoremap ( ()<Esc>i
