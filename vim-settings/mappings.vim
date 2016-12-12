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

nnoremap K kJ

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
