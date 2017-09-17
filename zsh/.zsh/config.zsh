# Language
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Tools to use
export EDITOR="nvim"
export PAGER="less"
export LESS="-R"

# See: man zshoptions
unsetopt menu_complete # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_cd # cd prefix not necessary to open a dir
setopt multios # Multiple output
setopt cdable_vars
setopt extended_glob # Allow special chars as part of filename patterns
setopt auto_menu # show completion menu on succesive tab press
setopt complete_in_word
setopt always_to_end

source "$ZSH_DIR/key-bindings.zsh"
source "$ZSH_DIR/completions.zsh"
source "$ZSH_DIR/history.zsh"
