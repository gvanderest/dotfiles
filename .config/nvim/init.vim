" General Theme Options
set number
syntax on

call plug#begin()
" Themes
Plug 'https://github.com/joshdick/onedark.vim.git'

" Tooling
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'blueyed/vim-diminactive'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'mileszs/ack.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'psf/black'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install && yarn add prettier-plugin-solidity',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'rust',
    \ 'html',
    \ 'swift',
    \ 'solidity'] }

" Languages
Plug 'tomlion/vim-solidity'
Plug 'heavenshell/vim-jsdoc'
Plug 'pantharshit00/vim-prisma'
Plug 'ekalinin/dockerfile.vim'
Plug 'hashivim/vim-terraform'
Plug 'jparise/vim-graphql'
call plug#end()

" One Dark Theme
colorscheme onedark
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

" Telescope
nnoremap <D-t> <cmd>Telescope git_files<cr>
nnoremap <D-S-f> <cmd>Telescope live_grep<cr>

" Lightline
set laststatus=2

set tabstop=4
set shiftwidth=4
set expandtab

" CoC
set updatetime=50

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

" NERDTree
let NERDTreeShowHidden=1
function! IsNerdTreeEnabled()
    return exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
endfunction

function! NerdToggle()
    if IsNerdTreeEnabled()
        NERDTreeToggle
    else
        if expand("%") == ""
            NERDTreeCWD
        else
            NERDTreeFind
        endif
    endif
endfunction
noremap <silent> <leader><leader> :call NerdToggle()<CR>
noremap <silent> <D-[> :call NerdToggle()<CR>
function! NerdFindIfNerdTreeOpen()
    if IsNerdTreeEnabled()
        NERDTreeFind
    endif
endfunction

au BufReadPost,BufNewFile call NerdFindIfNerdTreeOpen()

function! GetOutOfEverything()
    noh
endfunction
noremap <silent> <Esc> :call GetOutOfEverything()<CR>

" Share Clipboards
set clipboard=unnamedplus


" Window splitting / moving
noremap <silent> <D-w> :close<CR>
noremap <silent> <C-t> :tabnew<CR>
noremap <silent> <D-S-Right> :vsplit<CR>:wincmd l<CR>
noremap <silent> <D-S-Down> :split<CR>:wincmd j<CR>
noremap <silent> <D-Right> :wincmd l<CR>
noremap <silent> <D-Left> :wincmd h<CR>
noremap <silent> <D-Up> :wincmd k<CR>
noremap <silent> <D-Down> :wincmd j<CR>
command! BW :bn|:bd#
noremap <silent> <leader>bd :BW<CR>

" NERDCommenter
noremap <silent> <D-/> <Plug>NERDCommenterToggle<CR>

" CoC Related Items
noremap <silent> <leader>e :CocDiagnostics<CR>
noremap <leader>gd :call CocActionAsync('jumpDefinition')<CR>
noremap <D-LeftMouse> :call CocActionAsync('jumpDefinition')<CR>

command Config e ~/.config/nvim/init.vim
command Reload source ~/.config/nvim/init.vim
nmap <leader>rn <Plug>(coc-rename)
nmap <D-r> <Plug>(coc-rename)

vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Character lines!
set colorcolumn=80,120
noremap <silent> <leader>gb :Git blame<CR>


" Linters and Formatting
autocmd BufWritePost * call CocAction('format')
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
let g:prettier#exec_cmd_path = '~/.nvm/versions/node/v14.18.0/bin/prettier'
let g:prettier#autoformat = 0
autocmd BufWritePre *.sol Prettier

inoremap <silent><expr> <c-space> coc#refresh()
