# Lazy me
alias reload="source $HOME/.zshrc"
alias sudo="nocorrect sudo"
alias vim="nvim"

alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias la="ls -lahp"
alias l="less"
alias lf="less +F"

alias cop="be rubocop"
alias cov="open coverage/index.html"

# Directory shortcuts
alias c="cd"
alias desk="cd $HOME/Desktop"
alias home="cd $HOME/"
alias tdb="cd $HOME/tombruijn/"
alias pro="cd $HOME/projects/"
alias dot="cd $HOME/tombruijn/dotfiles"
alias exp="cd $HOME/projects/experiments"

# Small utilities
alias flushdns="sudo discoveryutil mdnsflushcache"
alias pgstart="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pgstop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
alias redis="redis-server /usr/local/etc/redis.conf"
alias md="open -a \"iA Writer.app\""

# Git
alias g="open -a gitx ."
alias t="tig"
alias ts="tig status"
alias gs="git status -sb"
alias gdw="git diff --ignore-all-space --word-diff=color"
alias gf="git-fixup"
alias gb="git branch"
alias gc="git checkout"
alias gm="git merge"
alias gpu="git push"
alias gpo="git push origin"
alias gpl="git pull"
alias grv="git remote -v"
alias gri="git rebase --interactive --autosquash"
alias gra="git rebase --abort"
alias grc="git rebase --continue"
alias gsl="git stash list"
alias gsd="git stash drop"
alias gsp="git stash pop"
alias gsa="git stash --include-untracked"

# Bundle exec
alias be="bundle exec"
alias br="be rspec"
alias cbr="COV=1 be rspec"
alias fs="be foreman start"

# Rake tasks
alias rake="noglob rake" # allows square brackets for rake task invocation

# Rails
alias PROD="RAILS_ENV=production"
alias TEST="RAILS_ENV=test"
alias DEV="RAILS_ENV=development"

alias rs="bundle exec rails server -b 0.0.0.0"
alias rc="bundle exec rails console"
alias rg="bundle exec rails generate"

alias rr="bundle exec rake routes"
alias rdm="bundle exec rake db:migrate"
alias rdr="bundle exec rake db:migrate:reset"
alias rdsd="rdr && SEED_DEMO=1 bundle exec rake db:seed"
