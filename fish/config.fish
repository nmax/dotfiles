set fish_key_bindings fish_vi_key_bindings
set -x EDITOR nvim
set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'

set -gx PATH ~/.cargo/bin ~/.yarn-config/global/node_modules/.bin/ $PATH
set -gx LIBRARY_PATH $LIBRARY_PATH /usr/local/lib

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

# loads rbenv
status --is-interactive; and . (rbenv init -|psub)

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
