set guifont=Source\ Code\ Pro:h16

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Removes left scrollbar
set go-=L

set background=light
colorscheme solarized

if !has('gui_running')
  let g:solarized_termcolors=16
  "set background=dark
endif
