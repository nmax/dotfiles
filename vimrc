set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim' " Plugin Manager

Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree' " File Tree Browser
Plugin 'benekastah/neomake'
Plugin 'ctrlpvim/ctrlp.vim' " fuzzy finder
Plugin 'rking/ag.vim'
Plugin 'Valloric/YouCompleteMe'

Plugin 'tpope/vim-surround'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'justincampbell/vim-eighties'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdcommenter' " For comments

Plugin 'mustache/vim-mustache-handlebars'
Plugin 'pangloss/vim-javascript' " Syntax for js
Plugin 'rust-lang/rust.vim'

call vundle#end()            " Required by Vundle
filetype plugin indent on    " Required by Vundle 

source ~/dotfiles/vim-settings/plugins.vim
source ~/dotfiles/vim-settings/general.vim
source ~/dotfiles/vim-settings/mappings.vim
source ~/dotfiles/vim-settings/window.vim
