" Disable some Mac hotkeys
if has("gui_macvim")
    macmenu &File.Print key=<nop>
    macmenu &File.Close key=<C-w>
    macmenu &File.New\ Tab key=<nop>
    macmenu &Edit.Find.Use\ Selection\ for\ Find key=<nop>
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
unmap <D-p>
map <D-p> :CtrlP<CR>
map <D-t> :CtrlP<CR>

" Window splitting / moving
noremap <silent> <D-w> :close<CR>
noremap <silent> <C-t> :tabnew<CR>
noremap <silent> <D-S-Right> :vsplit<CR>:wincmd l<CR>
noremap <silent> <D-S-Down> :split<CR>:wincmd j<CR>
noremap <silent> <D-Right> :wincmd l<CR>
noremap <silent> <D-Left> :wincmd h<CR>
noremap <silent> <D-Up> :wincmd k<CR>
noremap <silent> <D-Down> :wincmd j<CR>

" Ack
map <D-S-f> :Ack 

" NERDCommenter
map <D-/> <Plug>NERDCommenterToggle

" CoC Related Items
map <D-e> :CocDiagnostics<CR>
