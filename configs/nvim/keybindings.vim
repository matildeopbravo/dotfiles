nmap <M-f> :NERDTreeToggle<CR>
nmap <M-t> :FloatermNew<CR>
vnoremap <C-c> "+y
map <F2> :w! <CR>
vnoremap <C-Shift-c> gg"*yG
vnoremap <C-J> <C-W><C-J>

"navigating split files
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>noremap <C-x> "+d
noremap <buffer> <silent> j gj
noremap <buffer> <silent> k gk
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$
nnoremap s :%s/\<<C-r><C-w>\>/
nnoremap S :%s//g<Left><Left>
vnoremap s :%s/\<<C-r><C-w>\>/
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

nnoremap <leader>z :set foldmethod=indent<CR>
au FileType c nnoremap <leader>r :call CompileC()<CR>
fu! CompileC()
    write
    if filereadable('makefile') || filereadable('Makefile')
        make
    else
        make %:r
        !./%:r
    endif
endfu

command! -bang -nargs=1 Rename call RenameFunc(<q-args>, <bang>0)
fu! RenameFunc(new_name, bang)
    let l:aux=expand('%')
    execute 'saveas'.(a:bang?'! ':' ').a:new_name
    execute 'silent !rm -f '.l:aux
endfu
