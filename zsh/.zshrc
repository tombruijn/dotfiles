# Add RVM to PATH for scripting
export PATH="$HOME/.rvm/bin:$PATH"

# export LANGUAGE=en_US.UTF-8
# export LC_ALL=en_US.UTF-8

# General (OM)ZSH Environment Variables
ZSH="$HOME/.oh-my-zsh"    # Path to my OMZSH installation
ZSH_DIR="$HOME/.zsh"      # Path to my custom ZSH directory
ZSH_THEME="miloshadzic"  # ZSH Theme ( from: $HOME/.oh-my-zsh/themes )

# Load OMZSH Plugins
plugins=(git bundler rails3 rake ruby brew gem cap)

# Load OMZSH Core
source "$ZSH/oh-my-zsh.sh"

# Aliases
source "$ZSH_DIR/aliases"

# Config
source "$ZSH_DIR/oh-my-zsh-config"

# Base paths
export PATH="$HOME/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Heroku Toolbelt bin path
export PATH="/usr/local/heroku/bin:$PATH"

# Node Packager Manager bin path
export PATH="/usr/local/share/npm/bin:$PATH"
