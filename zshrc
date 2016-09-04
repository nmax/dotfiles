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

# Load RVM into a shell session *as a function*
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then
  # First try to load from a user install
  source "$HOME/.rvm/scripts/rvm"
elif [[ -s "/usr/local/rvm/scripts/rvm" ]] ; then
  # Then try to load from a root install
  source "/usr/local/rvm/scripts/rvm"
else
  printf "ERROR: An RVM installation was not found.\n"
fi
