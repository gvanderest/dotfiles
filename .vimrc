call plug#begin()
"
" Themes
Plug 'https://github.com/joshdick/onedark.vim.git'

" Always on plugins
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'blueyed/vim-diminactive'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'mileszs/ack.vim'

call plug#end()

" OneDark Theme
syntax on
colorscheme onedark
set number
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

" Lightline
set laststatus=2

set tabstop=4
set shiftwidth=4
set expandtab

" CoC
set updatetime=50
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" CtrlP
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_max_files=0 
let g:ctrlp_show_hidden=1

" coc-highlight
autocmd CursorHold * silent call CocActionAsync('highlight')

" NERDCommenter
filetype plugin on

" Dim Inactive
let g:diminactive_enable_focus = 1

" Swap files
set swapfile
set dir=~/tmp

