ZSH_DIR="$HOME/.zsh" # Path to my custom ZSH directory

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

# Heroku Toolbelt bin path
export PATH="/usr/local/heroku/bin:$PATH"

# Rust paths
export PATH="$HOME/.cargo/bin:$PATH"

# pgit tool
export PGIT_URL=git@repositories.tomdebruijn.com

# chruby
source "/usr/local/share/chruby/chruby.sh"
source "/usr/local/share/chruby/auto.sh"

export HOMEBREW_NO_ANALYTICS=1
