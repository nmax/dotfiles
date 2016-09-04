call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'benekastah/neomake'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'justinmk/vim-sneak'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'skalnik/vim-vroom',
Plug 'vim-scripts/BufOnly.vim'
Plug 'rust-lang/rust.vim'
call plug#end()

" --- Basics ---
syntax enable
set relativenumber
set laststatus=2
set cursorline
set cmdheight=1
set scrolloff=3
set noshowmode " Hides the --Insert-- line that is replaced by vim-airline
set wildmenu " Visual autocomplete for command menu
set splitbelow
set splitright
set cc=81
let mapleader = "\<Space>"

" --- Whitespace ---
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
set nowrap " Don't wrap lines
set list " Show invisible characters
set backspace=indent,eol,start " backspace through everything in insert mode

" --- List chars ---
set listchars="" " Reset the listchars
set listchars=tab:\ \  " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:. " show trailing spaces as dots
set listchars+=extends:> " The character to show in the last column when wrap
                         " is off and the line continues beyond the right of
                         " the screen
set listchars+=precedes:< " The character to show in the last column when wrap
                          " is off and the line continues beyond the left of
                          " the screen

" --- Searching ---
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

" --- Wild settings ---
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
" Ignore archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
" Ignore librarian-chef, vagrant, test-kitchen and Berkshelf cache
set wildignore+=*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*
" Ignore rails temporary asset caches
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
" Ignore temp and backup files
set wildignore+=*.swp,*~,._*

" --- Backup and swap files ---
set backupdir^=~/dotfiles/_backup//    " where to put backup files.
set directory^=~/dotfiles/_temp//      " where to put swap files.
set noswapfile

" --- Abbreviations ----
autocmd FileType ruby iab <buffer> pry! require 'pry'; binding.pry
autocmd FileType ruby iab <buffer> vcr! VCR.record_this_example
autocmd FileType ruby iab <buffer> screenshot! page.save_screenshot 'test.png', full: true

" --- Theme ---
colorscheme gruvbox
set bg=dark

" --- Airline ---
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_tabs = 0
" hide the path and show filename only
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_left_sep = ''
let g:airline_right_sep = ''


let g:rustfmt_autosave = 1

" ------ vimux -------
let g:VimuxOrientation = "h"

function! OpenVimuxPrompt(orientation, size)
  let g:VimuxOrientation=a:orientation
  let g:VimuxHeight=a:size
  execute 'VimuxPromptCommand'
endfunction

nmap <Leader>rc :wa<CR>:call OpenVimuxPrompt('v', '30')<CR>
nmap <Leader>rvc :wa<CR>:call OpenVimuxPrompt('h', '40')<CR>
nmap <Leader>rc :wa<CR>:call OpenVimuxPrompt('v', '15')<CR>
nmap <Leader>rvc :wa<CR>:call OpenVimuxPrompt('h', '40')<CR>

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

" --- FZF ---
nnoremap <C-P> :Files<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>fl :BLines<CR>
nnoremap <Leader>fL :Lines<CR>
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
nnoremap <Leader>/ :Ag <CR>

" ---  NERDTree ---
nnoremap <F5> :NERDTreeToggle<CR>

" --- Neomake ---
autocmd! BufWritePost * Neomake

" --- Rust.vim ---
let g:rustfmt_autosave = 1

>>>>>>> Cleanup
au BufReadPost *.hbs set syntax=mustache
au BufNewFile,BufRead *.json.jbuilder set ft=ruby

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWritePre * silent! :call DeleteTrailingWS()

" --- Mappings ---
" Copy to clippy
nnoremap <leader>y :call system('nc localhost 8377', @0)<CR>

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Save with enter because typing :w sucks
nnoremap <CR> :w <CR>
" Disable ex mode
nnoremap Q q
" Prevent * from jumping to the next word occurance
nnoremap * *N

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

nnoremap <leader>hs :nohl<CR>

" Bubble lines up and down
nnoremap <leader>k V:move '<-2<CR><Esc>
nnoremap <leader>j V:move '>+1<CR><Esc>
vnoremap <leader>k :move '<-2<CR>gv
vnoremap <leader>j :move '>+1<CR>gv

" Quit term mode
tnoremap <Esc> <C-\><C-n>

nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>q :bd<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>1 :b 1<CR>
nnoremap <Leader>2 :b 2<CR>
nnoremap <Leader>3 :b 3<CR>
nnoremap <Leader>4 :b 4<CR>
nnoremap <Leader>5 :b 5<CR>
nnoremap <Leader>6 :b 6<CR>
nnoremap <Leader>7 :b 7<CR>
nnoremap <Leader>8 :b 9<CR>
nnoremap <Leader>9 :b 9<CR>
