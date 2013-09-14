alias reload="source $HOME/.zshrc"

# Lazy me
alias sudo="nocorrect sudo"
alias ..="cd .."
alias o="open ."
alias la="ls -la"
alias desk="cd $HOME/Desktop"
alias home="cd $HOME/"
alias pro="cd $HOME/projects/"
alias kep="cd $HOME/keplar/"
alias m="cd $HOME/machinery/"
alias 8="cd $HOME/80beans/"
if [[ $(uname -s) == "Darwin" ]]; then
  alias flushdns="dscacheutil -flushcache"
else
  alias flushdns="sudo /etc/init.d/nscd restart"
fi;
alias sublime="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"

# Git
alias g="open -a gitx ."
alias gs="git status"
alias gb="git branch"
alias gc="git checkout"
alias gpu="git push"
alias gpl="git pull"
alias grv="git remote -v"
alias gri="git rebase -i"
alias gsl="git stash list"
alias gsd="git stash drop"
alias gsp="git stash pop"
alias gsa="git stash --include-untracked"

# Bundle exec
alias be="bundle exec"
alias ber="be rake"
alias bet="be rspec"
alias fs="be foreman start"
alias gu="be guard"

# Rake tasks
alias rr="be rake routes"
alias rake="noglob rake" # allows square brackts for rake task invocation

# Rails
alias PROD="RAILS_ENV=production"
alias TEST="RAILS_ENV=test"
alias DEV="RAILS_ENV=development"

alias rs="bundle exec rails server"
alias rc="bundle exec rails console"

alias rdm="bundle exec rake db:migrate"
alias rdr="bundle exec rake db:migrate:reset"
alias rds="bundle exec rake db:seed"

# Oh openssl on Mac..... There are no words
alias sslhack="echo \"OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE\" > config/initializers/opensslhack.rb"
alias sslremove="rm config/initializers/opensslhack.rb"
