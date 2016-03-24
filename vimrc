set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf

call vundle#begin()

Plugin 'gmarik/Vundle.vim' " Plugin Manager

Plugin 'morhetz/gruvbox'
Plugin 'benekastah/neomake'

Plugin 'scrooloose/nerdtree' " File Tree Browser
Plugin 'scrooloose/nerdcommenter' " For comments

Plugin 'junegunn/fzf.vim'
Plugin 'Valloric/YouCompleteMe'

Plugin 'sheerun/vim-polyglot'

Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'justincampbell/vim-eighties'
Plugin 'christoomey/vim-tmux-navigator'

Plugin 'benmills/vimux'
Plugin 'skalnik/vim-vroom',

call vundle#end()            " Required by Vundle

filetype plugin indent on    " Required by Vundle 

source ~/dotfiles/vim-settings/general.vim
source ~/dotfiles/vim-settings/mappings.vim

let &colorcolumn=join(range(81,999),",")

" add jbuilder syntax highlighting
au BufNewFile,BufRead *.json.jbuilder set ft=ruby

nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
nnoremap <Leader>/ :Ag <CR>

" ------ vimux -------
" Prompt for a command to run in a tmux pane
nmap <Leader>rc :wa<CR>:call OpenVimuxPrompt('v', '15')<CR>
nmap <Leader>rvc :wa<CR>:call OpenVimuxPrompt('h', '40')<CR>
function! OpenVimuxPrompt(orientation, size)
  let g:VimuxOrientation=a:orientation
  let g:VimuxHeight=a:size
  execute 'VimuxPromptCommand'
endfunction

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

" NERDTree
nnoremap <F5> :NERDTreeToggle<CR>

" Neomake
let g:neomake_javascript_jshint_maker = {
    \ 'args': ['--verbose'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    \ }
let g:neomake_javascript_enabled_makers = ['jshint']
autocmd! BufWritePost * Neomake


" Misc
au BufReadPost *.hbs set syntax=mustache
au BufReadPost *.rs set ft=rust

" Copy to clippy 
nnoremap <leader>y :call system('nc localhost 8377', @0)<CR>

" Window Stufff

"set guifont=Source\ Code\ Pro\ 13
set guifont=Hack\ 14

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

 "Removes left scrollbar in MacVim
"set go-=L
"set go-=T

colorscheme gruvbox
set bg=dark
