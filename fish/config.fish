set fish_key_bindings fish_vi_key_bindings
set -x EDITOR nvim
set fish_user_paths "/usr/local/bin"

set fish_user_abbreviations
function abbr_add
  set fish_user_abbreviations $fish_user_abbreviations $argv
end

alias vim "nvim"
alias vi "nvim"

set LANG de_DE.UTF-8

if test -e ~/.local.fish
  source ~/.local.fish
end
