#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

alias aba_i_bims='sudo $(history -p !!)'

export BUNDLER_EDITOR="nvim"
export EDITOR="nvim"
export VISUAL="nvim"

export NVIM_DIR=${HOME}/.config/nvim
export FZF_DEFAULT_COMMAND='ag -l'

export PATH="/opt/cmake-3.4.0-Linux-x86_64/bin/:$PATH"

bindkey -v
export KEYTIMEOUT=1

source ~/dotfiles/_alias.zsh
source ~/dotfiles/_functions.zsh
source ~/.cargo/env

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
