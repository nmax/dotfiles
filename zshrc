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

export BUNDLER_EDITOR="nvim"
export EDITOR="nvim"
export VISUAL="nvim"

export NVIM_DIR=${HOME}/.config/nvim
export NVIM_TUI_ENABLE_TRUE_COLOR=1

export PATH="/opt/cmake-3.4.0-Linux-x86_64/bin/:$PATH"

bindkey -v
export KEYTIMEOUT=1

source ~/dotfiles/_alias.zsh
source ~/dotfiles/_functions.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
