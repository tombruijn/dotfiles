# Lazy me
alias reload="source $HOME/.zshrc"
alias sudo="nocorrect sudo"
alias vim="nvim"

alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias la="eza -la --group-directories-first --octal-permissions --no-permissions --git --time-style='long-iso'"
alias l="less"
alias lf="less +F"

alias n="nnn -H -d"

alias cop="be rubocop"
alias cov="open coverage/index.html"

# Directory shortcuts
alias c="z"
alias ci="zi"
alias desk="cd $HOME/Desktop"
alias tdb="cd $HOME/tombruijn/"
alias pro="cd $HOME/projects/"
alias dot="cd $HOME/tombruijn/dotfiles"
alias exp="cd $HOME/projects/experiments"

# Small utilities
postgres_path="/opt/homebrew/var/postgresql@15/"
alias flushdns="sudo discoveryutil mdnsflushcache"
alias pgstart="pg_ctl -D $postgres_path -l $postgres_path/server.log start"
alias pgstop="pg_ctl -D $postgres_path stop -s -m fast"
alias redis="redis-server /opt/homebrew/etc/redis.conf"
alias md="open -a \"iA Writer.app\""

# Git
alias g="fork open"
alias t="tig"
alias ts="tig status"
alias gs="git status -sb"
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

alias rr="bundle exec rails routes"
alias rdm="bundle exec rails db:migrate"
alias rdr="bundle exec rails db:migrate:reset"
alias rdsd="rdr && SEED_DEMO=1 bundle exec rails db:seed"
