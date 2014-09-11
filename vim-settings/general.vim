set nocompatible              
set anti enc=utf-8
set guifont=Source\ Code\ Pro:h16
set relativenumber

" Required by Vundle
filetype off

syntax enable

" Remapping for CtrlP in macvim
if has("gui_macvim")
  macmenu &File.New\ Tab key=<D-S-t>
endif

" Autosave when switching away from vim
if has("autocmd")
  au FocusLost * silent! wall
endif
