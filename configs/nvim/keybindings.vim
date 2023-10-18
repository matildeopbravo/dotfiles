let mapleader = " "
au Filetype c nnoremap K :Man<CR>
nmap <M-f> :NERDTreeToggle<CR>
nmap <M-t> :FloatermNew<CR>
vnoremap <C-c> "+y
vnoremap <C-x> "+dd"
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
nnoremap gF <C-W>gf
vnoremap gF <C-W>gf

nnoremap <leader>z :set foldmethod=indent<CR>
"autocmd Filetype c let b:c=true
au FileType c nnoremap <leader>r :call CompileC()<CR>
au FileType cpp nnoremap <leader>r :call CompileC()<CR>
fu! CompileC()
    write
    if filereadable('makefile') || filereadable('Makefile')
        make
    else
        make %:r
        !./%:r
    endif
endfu
au FileType typescript nnoremap <leader>r :call CompileTypescript()<CR>
fu! CompileTypescript()
        !tsc %
        !node %:r.js
endfu
au FileType javascript nnoremap <leader>r :call CompileJavascript()<CR>
fu! CompileJavascript()
        !node %:r.js
endfu
au FileType go nnoremap <leader>r :call CompileGo()<CR>
fu! CompileGo()
        !go run %:r.go
endfu

nnoremap <leader>r :call Run()<CR>
fu! Run()
    write
    exec '!' &filetype '%'
endfu

command! -bang -nargs=1 Rename call RenameFunc(<q-args>, <bang>0)
fu! RenameFunc(new_name, bang)
    let l:aux=expand('%')
    execute 'saveas'.(a:bang?'! ':' ').a:new_name
    execute 'silent !rm -f '.l:aux
endfu
nnoremap "p :reg <bar> exec 'normal! "'.input('>').'p'<CR>

nnoremap <leader>w :call RandomColorScheme()<CR>
function RandomColorScheme()
  let mycolors = split(globpath(&rtp,"**/colors/*.vim"),"\n")
  exe 'so ' . mycolors[localtime() % len(mycolors)]
  unlet mycolors
endfunction

:command NewColor call RandomColorScheme()
"autocmd VimEnter * NewColor
let t:is_transparent = 0
function! Toggle_transparent()
    if t:is_transparent == 0
        hi Normal guibg=NONE ctermbg=NONE
        let t:is_transparent = 1
    else
        set background=dark
        let t:is_tranparent = 0
    endif
endfunction
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
