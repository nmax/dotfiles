" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Removes left scrollbar
set go-=L

set background=light
colorscheme solarized

if !has('gui_running')
  set background=dark
endif
