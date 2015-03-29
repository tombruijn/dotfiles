alias reload="source $HOME/.zshrc"

# Lazy me
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias sudo="nocorrect sudo"
alias o="open ."
alias la="ls -lah"

# Directory shortcuts
alias ..="cd .."
alias desk="cd $HOME/Desktop"
alias home="cd $HOME/"
alias tdb="cd $HOME/tombruijn/"
alias pro="cd $HOME/projects/"
alias pgo="cd $HOME/projects/go"
alias dotfiles="cd $HOME/projects/dotfiles"
alias kep="cd $HOME/keplar/"
alias kepd="open $HOME/keplar/docs"
alias m="cd $HOME/machinery/"
alias 8="cd $HOME/80beans/"

# Small utilities
if [[ $(uname -s) == "Darwin" ]]; then
  alias flushdns="dscacheutil -flushcache"
else
  alias flushdns="sudo /etc/init.d/nscd restart"
fi;
alias pgstart="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pgstop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
alias redis="redis-server /usr/local/etc/redis.conf"
alias mou="open -a mou"

# Git
alias g="open -a gitx ."
alias gs="git status"
alias gb="git branch"
alias gc="git checkout"
alias gm="git merge"
alias gpu="git push"
alias gpo="git push origin"
alias gpl="git pull"
alias grv="git remote -v"
alias gri="git rebase -i"
alias gsl="git stash list"
alias gsd="git stash drop"
alias gsp="git stash pop"
alias gsa="git stash --include-untracked"

# Bundle exec
alias be="bundle exec"
alias s="spring"
alias br="be rspec"
alias sr="s rspec"
alias cbr="COV=1 be rspec"
alias csr="COV=1 s rspec"
alias fs="be foreman start"

# Rake tasks
alias rake="noglob rake" # allows square brackts for rake task invocation

# Rails
alias PROD="RAILS_ENV=production"
alias TEST="RAILS_ENV=test"
alias DEV="RAILS_ENV=development"

alias srs="s rails server"
alias rs="bundle exec rails server"
alias src="s rails console"
alias rc="bundle exec rails console"
alias rg="bundle exec rails generate"

alias srr="s rake routes"
alias rr="bundle exec rake routes"
alias rdm="bundle exec rake db:migrate"
alias rdr="bundle exec rake db:migrate:reset"
alias rds="bundle exec rake db:seed"
alias rdi="rdr && rds"
alias rdsd="rdr && SEED_DEMO=1 bundle exec rake db:seed"
alias sseed="s rake db:migrate:reset && SEED_DEMO=1 s rake db:seed"

# Other
alias cop="be rubocop"
alias cov="open coverage/index.html"

# Oh openssl on Mac..... There are no words
alias sslhack="echo \"OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE\" > config/initializers/opensslhack.rb"
alias sslremove="rm config/initializers/opensslhack.rb"
