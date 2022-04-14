" Setup plugins to install..
call plug#begin()
" Themes
Plug 'https://github.com/joshdick/onedark.vim.git'

" Always on plugins
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'

" On demand plugins
Plug 'https://github.com/kien/ctrlp.vim.git', { 'on': 'CtrlP' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()

" OneDark Theme
syntax on
colorscheme onedark
number
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

" NERDTree
map <D-[> :NERDTreeToggle<CR>

" CtrlP
if has("gui_macvim")
	macmenu &File.Print key=<nop>
endif
unmap <D-p>
map <D-p> :CtrlP<CR>

" Window splitting / moving
map <C-t> :tabnew<CR>
map <D-S-Right> :vsplit<CR>
map <D-S-Down> :split<CR>
map <D-Right> :wincmd l<CR>
map <D-Left> :wincmd h<CR>
map <D-Up> :wincmd k<CR>
map <D-Down> :wincmd j<CR>

PlugInstall
