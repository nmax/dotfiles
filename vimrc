" Sets the runtime path to include Vundle and initialize
set rtp+=~/dotfiles/vim-plugins/Vundle.vim
call vundle#begin('~/dotfiles/vim-plugins/')

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
 
call vundle#end()            " Required by Vundle
filetype plugin indent on    " Required by Vundle


source ~/dotfiles/vim-settings/plugins.vim
source ~/dotfiles/vim-settings/general.vim
source ~/dotfiles/vim-settings/mappings.vim
source ~/dotfiles/vim-settings/window.vim

