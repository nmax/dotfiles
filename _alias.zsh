alias vim="nvim"
alias vi="nvim"

alias redmine_url='echo http://redmine.nwwo.de/issues/$(branch_current | grep -oh "^[0-9]\+")'
alias branch_oldest_ancestor='/usr/bin/diff -u <(git rev-list --first-parent master) <(git rev-list --first-parent HEAD) | sed -ne "s/^ //p" | head -1'
alias branch_current='git rev-parse --abbrev-ref HEAD'
alias branch_files='git diff $(branch_oldest_ancestor)..HEAD --diff-filter=ACMR --name-only --oneline'
alias branch_rubocop='branch_files | grep  "\.\(rb\|gemspec\)$" | xargs rubocop'

alias bitbucket_repo_url='echo https://$(git remote -v | grep -oh "bitbucket.org[:/][^ ]\+.git" | head -1 | sed "s/:/\//" | sed "s/\.git$//")'
alias bitbucket_review_url='echo $(bitbucket_repo_url)/branches/compare/$(branch_current)..$(branch_oldest_ancestor)'

alias vwc="cd /var/www/current"
alias clip="nc localhost 8377"

alias restart_nww="rake assets:clean && rake tmp:clear && touch tmp/restart.txt"
