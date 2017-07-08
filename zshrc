export BUNDLER_EDITOR="nvim"
export EDITOR="nvim"
export VISUAL="nvim"

export NVIM_DIR=${HOME}/.config/nvim
# export FZF_DEFAULT_COMMAND='ag -l'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export PATH="/opt/cmake-3.4.0-Linux-x86_64/bin/:$PATH"

bindkey -v
export KEYTIMEOUT=1

source ~/dotfiles/_alias.zsh
source ~/dotfiles/_functions.zsh
source ~/.cargo/env

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
