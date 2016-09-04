function browse
  open (eval $argv)
end

# https://github.com/Nix-wie-weg/zsh-functions-and-aliases
alias branch_oldest_ancestor='/usr/bin/diff -u (git rev-list --first-parent master | psub) (git rev-list --first-parent HEAD | psub) | sed -ne "s/^ //p" | head -1'
alias branch_log='git log (branch_oldest_ancestor)..HEAD'
alias branch_diff='git diff (branch_oldest_ancestor)..HEAD'
alias branch_files='git diff (branch_oldest_ancestor)..HEAD --diff-filter=ACMR --name-only --oneline'
alias bitbucket_repo_url='echo https://(git remote -v | grep -oh "bitbucket.org[:/][^ ]\+.git" | head -1 | sed "s/:/\//" | sed "s/\.git\$//")'
alias bitbucket_review_url='echo (bitbucket_repo_url)/branches/compare/(branch_current)..(branch_oldest_ancestor)'
alias redmine_url='echo http://redmine.nwwo.de/issues/(branch_current | grep -oh "^[0-9]\+")'
alias branch_rubocop="branch_files | grep '\.rb\$' | xargs rubocop"

# alias mount_nww="sshfs mneger@nix-wie-weg.max.s5.nix-wie-weg.de:/var/www/current ~/nww_seite -o idmap=user -o uid=$(id -u) -o gid=$(id -g)"
alias connect_dev_vm="ssh nix-wie-weg.max.s5.nix-wie-weg.de"
alias vwc="cd /var/www/current"

function restart_nww
  command "rake assets:clean"
  command "rake tmp:clear"
  command "touch tmp/restart.txt"
end
