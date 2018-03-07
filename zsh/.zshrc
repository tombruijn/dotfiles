ZSH_DIR="$HOME/.zsh" # Path to my custom ZSH directory

# Ensure unique paths within PATH. Useful on `reload`
typeset -U path

# `cd` can navigate to subdirectories in these directories from anywhere
setopt auto_cd
cdpath=(. .. ~/tombruijn ~/appsignal)

# Config
source "$ZSH_DIR/config.zsh"
source "$ZSH_DIR/functions.zsh"

# Git functions
source "$ZSH_DIR/git.zsh"

# Theme
source "$ZSH_DIR/appearance.zsh"
source "$ZSH_DIR/prompt.zsh"
source "$ZSH_DIR/termsupport.zsh"

# Aliases
source "$ZSH_DIR/aliases.zsh"

# Base paths
export PATH="$HOME/.bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:./bin:$PATH"
export PATH="/usr/local/opt/gnupg/bin:$PATH"

# Heroku Toolbelt bin path
export PATH="/usr/local/heroku/bin:$PATH"

# Rust paths
export PATH="$HOME/.cargo/bin:$PATH"

# Ansible
export PATH="/usr/local/opt/ansible@1.9/bin:$PATH"

# chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

# Enable Elixir IEX history
export ERL_AFLAGS="-kernel shell_history enabled"

export HOMEBREW_NO_ANALYTICS=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='ag -i --hidden --path-to-ignore ~/.ignore --no-color -g ""'

# Load private credentials from ~/.extra file
if [ -f ~/.extra ]; then
  source ~/.extra
fi

# Configure GPG
export GPG_TTY=$(tty)

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
