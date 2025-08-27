# Ensure unique paths within $PATH. Useful on calling `reload`
typeset -U path

# Configure Zsh prompt
# See: man zshoptions
unsetopt menu_complete # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_cd # `cd` command not necessary to open a dir
setopt multios # Enable multiple outputs
setopt cdable_vars
setopt extended_glob # Allow special chars as part of filename patterns
setopt auto_menu # Show completion menu on succesive tab press
setopt complete_in_word
setopt always_to_end

# Configure cd quick paths
# `cd` can navigate to subdirectories in these directories from anywhere
cdpath=(. .. ~/tombruijn ~/tombruijn/projects ~/tombruijn/writing ~/appsignal ~/projects/rubynl ~/projects)

# Load configuration files
ZSH_DIR="$HOME/.zsh" # Path to my custom ZSH directory

source "$ZSH_DIR/history.zsh"
source "$ZSH_DIR/key-bindings.zsh"
source "$ZSH_DIR/completions.zsh"
source "$ZSH_DIR/functions.zsh"
source "$ZSH_DIR/aliases.zsh"

# Theme
source "$ZSH_DIR/theme.zsh"
source "$ZSH_DIR/termsupport.zsh"
