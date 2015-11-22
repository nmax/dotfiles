let mapleader = "\<Space>"

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Save with lead enter because typing :w sucks
nnoremap <CR> :w <CR>

" Disable ex mode
nnoremap Q q

" Prevent * from jumping to the next word occurance
nnoremap * *N

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" Clear hlsearch with <leader>hs
nnoremap <leader>hs :nohl<CR>

" Bubble lines up and down
nnoremap <leader>k V:move '<-2<CR><Esc>
nnoremap <leader>j V:move '>+1<CR><Esc>
vnoremap <leader>k :move '<-2<CR>gv
vnoremap <leader>j :move '>+1<CR>gv

" Quit term mode
tnoremap <Esc> <C-\><C-n>

" Map Control-# to switch tabs
map  <C-0> 0gt
imap <C-0> <Esc>0gt
map  <C-1> 1gt
imap <C-1> <Esc>1gt
map  <C-2> 2gt
imap <C-2> <Esc>2gt
map  <C-3> 3gt
imap <C-3> <Esc>3gt
map  <C-4> 4gt
imap <C-4> <Esc>4gt
map  <C-5> 5gt
imap <C-5> <Esc>5gt
map  <C-6> 6gt
imap <C-6> <Esc>6gt
map  <C-7> 7gt
imap <C-7> <Esc>7gt
map  <C-8> 8gt
imap <C-8> <Esc>8gt
map  <C-9> 9gt
imap <C-9> <Esc>9gt

