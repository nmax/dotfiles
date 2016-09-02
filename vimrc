function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'

Plug 'benekastah/neomake'

Plug 'rust-lang/rust.vim'

Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'

Plug 'justinmk/vim-sneak'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

Plug 'sheerun/vim-polyglot'

" Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
" Plug 'justincampbell/vim-eighties'
Plug 'christoomey/vim-tmux-navigator'

Plug 'benmills/vimux'
Plug 'skalnik/vim-vroom',

Plug 'vim-scripts/BufOnly.vim'
Plug 'rust-lang/rust.vim'

" Add plugins to &runtimepath
call plug#end()

source ~/dotfiles/vim-settings/general.vim
source ~/dotfiles/vim-settings/mappings.vim


set expandtab

set cc=81

let g:rustfmt_autosave = 1

" ------ vimux -------
" Prompt for a command to run in a tmux pane
nmap <Leader>rc :wa<CR>:call OpenVimuxPrompt('v', '30')<CR>
nmap <Leader>rvc :wa<CR>:call OpenVimuxPrompt('h', '40')<CR>
function! OpenVimuxPrompt(orientation, size)
  let g:VimuxOrientation=a:orientation
  let g:VimuxHeight=a:size
  execute 'VimuxPromptCommand'
endfunction

let g:VimuxOrientation = "h"

" Run last command executed by RunVimTmuxCommand
nmap <Leader>rl :wa<CR>:VimuxRunLastCommand<CR>

" Inspect runner pane
nmap <Leader>ri :VimuxInspectRunner<CR>

" Close all other tmux panes in current window
nmap <Leader>rx :VimuxCloseRunner<CR>

" Zoom runner pane
nmap <Leader>rz :VimuxZoomRunner<CR>

" ---- vim-vroom settings ----
let g:vroom_use_vimux = 1
let g:vroom_use_bundle_exec = 1
let g:vroom_use_zeus = 1 " Always use zeus when it is running!

" FZF
nnoremap <C-P> :Files<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>fl :BLines<CR>
nnoremap <Leader>fL :Lines<CR>
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
nnoremap <Leader>/ :Ag <CR>

" NERDTree
nnoremap <F5> :NERDTreeToggle<CR>

" Neomake
" let g:neomake_javascript_jshint_maker = {
"     \ 'args': ['--verbose'],
"     \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
"     \ }
" let g:neomake_javascript_enabled_makers = ['jshint', 'coffeelint']
autocmd! BufWritePost * Neomake

" Misc
" TODO: Still needed?
au BufReadPost *.hbs set syntax=mustache
au BufNewFile,BufRead *.json.jbuilder set ft=ruby

" Copy to clippy 
nnoremap <leader>y :call system('nc localhost 8377', @0)<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

nnoremap <Leader>B :bd<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bp<CR>

colorscheme gruvbox
set bg=dark
