set rtp+=~/dotfiles/vim-plugins/Vundle.vim

" Adds the vimproc binaries to the vim rtp
set rtp+=~/dotfiles/vim-plugins/vimproc.vim/autoload
set rtp+=~/dotfiles/vim-plugins/vimproc.vim/plugin

" Adds syntax files for handlebars / mustache.
set rtp+=~/dotfiles/vim-plugins/vim-mustache-handlebars/ftdetect
set rtp+=~/dotfiles/vim-plugins/vim-mustache-handlebars/ftplugin
set rtp+=~/dotfiles/vim-plugins/vim-mustache-handlebars/syntax

call vundle#begin('~/dotfiles/vim-plugins/')

Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Shougo/neocomplete.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'

Plugin 'mustache/vim-mustache-handlebars'


call vundle#end()            " Required by Vundle
filetype plugin indent on    " Required by Vundle 

source ~/dotfiles/vim-settings/plugins.vim
source ~/dotfiles/vim-settings/general.vim
source ~/dotfiles/vim-settings/mappings.vim
source ~/dotfiles/vim-settings/window.vim
source ~/dotfiles/vim-settings/neocomplete.vim
source ~/dotfiles/vim-settings/unite.vim
