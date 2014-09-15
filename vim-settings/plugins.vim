"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore files that are not under vc.
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

let g:ctrlp_map = ''
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\.pyc$\|\.pyo$\|\.rbc$|\.rbo$\|\.class$\|\.o$\|\~$\',
  \ }

if has("gui_running")
  map <D-t> :CtrlP<CR>
  imap <D-t> <ESC>:CtrlP<CR>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']

map <leader>nn :NERDTreeToggle<CR> :NERDTreeMirror<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_quiet_messages = {'level': 'warnings'}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-javascript 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:javascript_conceal = 1
" set cole=1
