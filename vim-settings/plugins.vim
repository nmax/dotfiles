"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildignore+=*/tmp/*,*.so,*.swp,*.zip " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" 'dir':  '\v[\/]\.(git|hg|svn|bower_components|node_modules|tmp)$',
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](git|node_modules|hg|bower_components|tmp|svn|dist|public)$',
  \ 'file': '\v\.(exe|so|dll|woff|ttf|eot|otf)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_map = ''
nnoremap <C-P> :CtrlP<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']

nnoremap <F5> :NERDTreeToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_tidy_quiet_messages = { "level" : "warnings" }

let g:syntastic_enable_signs = 1
let g:syntastic_auto_jump = 0
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
au BufReadPost *.hbs set syntax=mustache
