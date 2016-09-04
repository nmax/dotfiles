set fish_key_bindings fish_vi_key_bindings
set -x EDITOR nvim

set PATH ~/.cargo/bin $PATH
set PATH ~/.rvm/bin $PATH

set fish_user_abbreviations
function abbr_add
  set fish_user_abbreviations $fish_user_abbreviations $argv
end

alias vim "nvim"
alias vi "nvim"

for file in (ls ~/dotfiles/fish/functions/eager)
  source ~/dotfiles/fish/functions/eager/$file
end

set LANG de_DE.UTF-8

if test -e ~/.local.fish
  source ~/.local.fish
end
