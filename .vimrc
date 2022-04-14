" Setup plugins to install..
call plug#begin()
" Themes
Plug 'https://github.com/joshdick/onedark.vim.git'

" Always on plugins
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" On demand plugins
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git', { 'on': 'CtrlP' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
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
