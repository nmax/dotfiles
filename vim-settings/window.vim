"set guifont=Source\ Code\ Pro\ 13
set guifont=Hack\ 12

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Removes left scrollbar
set go-=L
set go-=T

colorscheme solarized
set background=dark

if !has('gui_running')
  let g:solarized_termcolors=16
  set background=dark
endif
