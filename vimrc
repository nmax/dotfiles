call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
" Plug 'mhartington/oceanic-next'

Plug 'benekastah/neomake'

Plug 'rust-lang/rust.vim'
" Plug 'scrooloose/nerdtree'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'justinmk/vim-dirvish'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-eunuch'
Plug 'bronson/vim-visual-star-search'

Plug 'justinmk/vim-sneak'
Plug 'justinmk/vim-dirvish'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jgdavey/vim-blockle', { 'for': 'ruby' }

Plug 'Shougo/deoplete.nvim'
" Plug 'Valloric/YouCompleteMe'
Plug 'tmux-plugins/vim-tmux-focus-events'

Plug 'sheerun/vim-polyglot'

Plug 'nathanaelkane/vim-indent-guides'
Plug 'christoomey/vim-tmux-navigator'

Plug 'benmills/vimux'
Plug 'skalnik/vim-vroom',

Plug 'vim-scripts/BufOnly.vim'

" Add plugins to &runtimepath
call plug#end()

source ~/dotfiles/vim-settings/general.vim
source ~/dotfiles/vim-settings/mappings.vim

set termguicolors

autocmd FileType ruby iab <buffer> pry! require 'pry'; binding.pry
autocmd FileType ruby iab <buffer> vcr! VCR.record_this_example

" Use deoplete.
let g:deoplete#enable_at_startup = 1

set expandtab

set cc=81
set inccommand=nosplit

set autoread
let g:rustfmt_autosave = 1

function! FormatJSON()
:%!python -m json.tool
endfunction

" --- blockle ---
let g:blockle_mapping = '<Leader>bl'

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
" TODO
" nnoremap <F5> :NERDTreeToggle<CR>

" Neomake
" TODO
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

nnoremap <Leader>q :bd<CR>

" TODO: vim-sleuth?
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab

colorscheme gruvbox
set termguicolors
set bg=dark
