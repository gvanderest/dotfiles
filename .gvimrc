" Disable some Mac hotkeys
if has("gui_macvim")
    macmenu &File.Print key=<nop>
    macmenu &File.New\ Tab key=<nop>
endif

" Editor Visuals
set linespace=3

" NERDTree
function! IsNerdTreeEnabled()
    return exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
endfunction

function! NerdToggle()
NERDTreeToggle
if IsNerdTreeEnabled()
    NERDTreeCWD
endif
endfunction
map <D-[> :call NerdToggle()<CR>

" CtrlP
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_max_files=0 
unmap <D-p>
map <D-p> :CtrlP<CR>
map <D-t> :CtrlP<CR>

" Window splitting / moving
map <C-t> :tabnew<CR>
map <D-S-Right> :vsplit<CR>:wincmd l<CR>
map <D-S-Down> :split<CR>:wincmd j<CR>
map <D-Right> :wincmd l<CR>
map <D-Left> :wincmd h<CR>
map <D-Up> :wincmd k<CR>
map <D-Down> :wincmd j<CR>
