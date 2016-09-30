fbr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}

cook_and_clean () {
  bundle exec knife solo cook $(echo $0) --no-chef-check -W && bundle exec knife solo clean $(echo $0) --no--chef-check
}

bindkey '^Z' fancy-ctrl-z
zle -N fancy-ctrl-z
