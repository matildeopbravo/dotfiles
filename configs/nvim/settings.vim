set nocompatible
set termguicolors
filetype on
syntax on
filetype plugin indent on

syntax enable

highlight Normal guibg=none
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight NonText guibg=none
colorscheme gruvbox
set colorcolumn=80
set number relativenumber
" show tabs
set list
set listchars=tab:>-
set noshowmode
" folding
set expandtab
set shiftwidth=4
set cindent smarttab autoindent smartindent
set tabstop=4
set ignorecase smartcase
set completeopt-=preview "make clang complete not preview and just complete
set splitbelow splitright
set autochdir
set icm=nosplit

"Disable Copilot by default
let g:copilot_enabled = v:false
"autocmd Filetype * call RandomColorScheme()
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
autocmd FileType c ClangFormatAutoEnable
au BufRead,BufNewFile * setlocal textwidth=80
autocmd! BufNewFile,BufRead,BufReadPost,BufWritePost *.h set filetype=c
autocmd FileType html,xml set omnifunc=htmlcomplete#CompleteTags "autocomplete html
autocmd! BufWritePre * %s/\s\+$//e "clear trailing whitespace
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

set nuw=2 "width of the line number column

autocmd FileType make set noexpandtab

command Json set syntax=json

augroup Mkdir
  autocmd!
  autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END

augroup auFileTypes
  autocmd!
  autocmd FileType markdown setlocal textwidth=80
augroup end
  autocmd FileType json syntax match Comment +\/\/.\+$+

augroup ReactFiletypes
  autocmd!
  autocmd BufRead,BufNewFile *.jsx set filetype=javascriptreact
  autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact
augroup END

  "Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

lua << EOF
require('nvim-treesitter.configs').setup{
    ensure_installed = "all",

    highlight = { enable = true }
}
local remap = vim.api.nvim_set_keymap


--local npairs = require('nvim-autopairs')
--
--npairs.setup({ map_bs = false, map_cr = false })
--
--vim.g.coq_settings = { keymap = { recommended = false } }

-- these mappings are coq recommended mappings unrelated to nvim-autopairs
--remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
--remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
--remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
--remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })
--
---- skip it, if you use another global object
--_G.MUtils= {}
--
--MUtils.CR = function()
--  if vim.fn.pumvisible() ~= 0 then
--    if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
--      return npairs.esc('<c-y>')
--    else
--      return npairs.esc('<c-e>') .. npairs.autopairs_cr()
--    end
--  else
--    return npairs.autopairs_cr()
--  end
--end
--remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })
--
--MUtils.BS = function()
--  if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
--    return npairs.esc('<c-e>') .. npairs.autopairs_bs()
--  else
--    return npairs.autopairs_bs()
--  end
--end
--remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })
EOF
