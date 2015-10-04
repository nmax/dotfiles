"set guifont=Source\ Code\ Pro\ 13
set guifont=Hack\ 12

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Removes left scrollbar
set go-=L
set go-=T

if has("gui")
  set background=light
else
  set term=screen-256color-bce
  let g:solarized_termcolors=256
  set t_Co=256
  set background=dark
endif

colorscheme default
