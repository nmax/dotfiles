call plug#begin('~/.vim/plugged')
Plug 'machakann/vim-highlightedyank'
Plug 'andreypopp/vim-colors-plain'
Plug 'nightsense/snow'

" Plug 'cocopon/iceberg.vim'
Plug 'romainl/vim-qf'
" Plug 'romainl/vim-cool'
Plug 'raghur/vim-ghost', {'do': ':GhostInstall'}
Plug 'w0rp/ale'
" Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-eunuch'
Plug 'ludovicchabant/vim-gutentags'
Plug 'justinmk/vim-sneak'
Plug 'justinmk/vim-dirvish'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jgdavey/vim-blockle', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'sheerun/vim-polyglot'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'skalnik/vim-vroom',
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
call plug#end()

" runtime macros/sandwich/keymap/surround.vim

syntax enable
" set relativenumber
set autoread " If a file is changed outside of Vim reload it without asking
set statusline=%<\%f\ %m%r%y%w%=%l\/%-L\ %3c
set laststatus=2
set cmdheight=1
set scrolloff=3
set nowrap
set splitbelow
set splitright
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
set termguicolors
set hlsearch
set incsearch
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter
set infercase
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen
set hidden
set cc=81
set inccommand=nosplit
set pumheight=15
set completeopt+=longest


set wildmenu
set wildmode=list:full
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=./vendor/**/*,*/vendor/**/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=./tmp/**/*,*/tmp/librarian/*,*/.vagrant/*,*/.kitchen/*,*/vendor/cookbooks/*
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
set wildignore+=*.swp,*~,._*

set nobackup
set noswapfile
set undofile
set path=**

let mapleader = "\<Space>"
nnoremap <leader>y :call system('nc localhost 8377', @0)<CR>
nnoremap <Leader>q :bp<CR>:bd #<CR>
nnoremap <Leader>bo :only<CR>
noremap ' `
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap Q q
nnoremap * *N
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>
nnoremap K kJ
nnoremap <leader>hs :nohl<CR>
nnoremap <leader>k V:move '<-2<CR><Esc>
nnoremap <leader>j V:move '>+1<CR><Esc>
vnoremap <leader>k :move '<-2<CR>gv
vnoremap <leader>j :move '>+1<CR>gv
tnoremap <leader><Esc> <C-\><C-n>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h') . '/' : '%%'
" nmap ö <C-]>zz
nnoremap g; g;zz
noremap <bs> <C-^>
nnoremap <space><space> :silent grep <C-R><C-W>
tnoremap *<Esc> <C-\><C-n>
nnoremap g; g;zz

" TODO: PgUP/PgDown/Home/End?
nmap <F1> <Plug>qf_qf_previous
nmap <F2> <Plug>qf_qf_next
nmap <F3> <Plug>qf_qf_stay_toggle
nmap <F7> <Plug>qf_loc_previous
nmap <F8> <Plug>qf_loc_next
nmap <F9> <Plug>qf_loc_stay_toggle

let g:ale_ruby_rubocop_executable = "bundle"
let g:ale_open_list = 0
let g:lint_on_text_changed = 'never'
let g:qf_statusline = {}
let g:qf_statusline.before = '%<\ '
let g:qf_statusline.after = '\ %f%=%l\/%-6L\ \ \ \ \ '

let g:vroom_cucumber_path = 'cucumber'

augroup mkdir
  autocmd!
  if exists("*mkdir") "auto-create directories for new files
    au BufWritePre,FileWritePre * silent! call mkdir(expand('<afile>:p:h'), 'p')
  endif
augroup END

augroup bitbucket
  autocmd!

  function! InsertTicketNumer()
    .!git symbolic-ref --short HEAD
    normal I#
    normal 2wD
    normal A: 
  endfunction

  function! BitbucketFileLink()
    let base = "https://bitbucket.org/nix-wie-weg"
    let project = system("git remote -v | head -n1 | awk \'{print $2}\' | sed 's/.*\\///' | sed 's/\\.git//'")
    let git_head = system("git rev-parse HEAD")
    let file_path = expand("%:f")
    let branch = system("git rev-parse --abbrev-ref HEAD")
    let fileviewer = "file-view-default"
    let file_with_line = expand("%:t") . "-" . line(".")
    let url = base . "/" . project . "/src/" . git_head . "/" . file_path .  "?at=" . branch . "&fileviewer=file-view-default#" . file_with_line
    call append(line("."), substitute(url, '\n', '', 'g'))
    normal jviW
    echom "Bitbucket-Link erzeugt!"
  endfunction

  autocmd FileType gitcommit call InsertTicketNumer()
  command! BBLink :call BitbucketFileLink()
augroup END

" function! s:VisualStarSearch()
"   let temp = @s
"   norm! gv"sy
"   let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
"   let @s = temp
" endfunction
" noremap * :<C-u>call <SID>VisualStarSearch()<CR>/<C-R>=@/<CR><CR>

autocmd FileType ruby iab <buffer> pry! require 'pry'; binding.pry
autocmd FileType ruby iab <buffer> vcr! VCR.record_this_example


" set autoread
" let g:rustfmt_autosave = 1
" let g:rustfmt_fail_silently=1

function! FormatXML()
  :%!xmllint --format -
endfunction
command! FormatXML :call FormatXML()

function! Rubocop()
  :silent !bundle exec rubocop -a %
endfunction
command! Rubocop :call Rubocop()

function! FormatJSON()
  :%!python -m json.tool
endfunction
command! FormatJSON :call FormatJSON()

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

nmap <Leader>rl :wa<CR>:VimuxRunLastCommand<CR>
nmap <Leader>ri :VimuxInspectRunner<CR>
nmap <Leader>rx :VimuxCloseRunner<CR>
nmap <Leader>rz :VimuxZoomRunner<CR>

" ---- vim-vroom settings ----
let g:vroom_use_vimux = 1
let g:vroom_use_zeus = 1 " Always use zeus when it is running!

" FZF
nnoremap <C-P> :Files<CR>
nnoremap <Leader>tt :Tags<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>fl :BLines<CR>
nnoremap <Leader>fL :Lines<CR>
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
nnoremap <Leader>/ :Ag <CR>

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

if executable('rg')
  set grepprg=rg\ --vimgrep
  set grepformat^=%f:%l:%c:%m
endif

let g:highlightedyank_highlight_duration = 300

au BufReadPost *.hbs set syntax=mustache
au BufNewFile,BufRead *.json.jbuilder,*.god set ft=ruby

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" let g:LanguageClient_serverCommands = {
"             \ 'ruby': [ 'solargraph',  'stdio' ],
"             \ }

" nnoremap <F5> :call LanguageClient_contextMenu()<CR>

set termguicolors
set background=light
colorscheme snow
