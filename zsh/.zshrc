###############################################################################
# $PATH configuration

## Ensure unique paths within $PATH. Useful on calling `reload`
typeset -U path

## Base paths
export PATH="$HOME/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
## Homebrew paths
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
## Rust paths
export PATH="$HOME/.cargo/bin:$PATH"
## MongoDB custom path
export PATH="/usr/local/opt/mongodb-community@3.6/bin:/opt/homebrew/opt/mongodb-community@3.6/bin:$PATH"

###############################################################################
# Configuration

## Set language and encoding
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_COLLATE=C

## Configure Zsh prompt
## See: man zshoptions
unsetopt menu_complete # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_cd # `cd` command not necessary to open a dir
setopt multios # Enable multiple outputs
setopt cdable_vars
setopt extended_glob # Allow special chars as part of filename patterns
setopt auto_menu # Show completion menu on succesive tab press
setopt complete_in_word
setopt always_to_end

# Tools to use
export EDITOR="nvim"
export PAGER="less"
export LESS="-R"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Configure shared config dir
export XDG_CONFIG_HOME="$HOME/.config"
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/.ripgreprc"

## Configure cd quick paths
## `cd` can navigate to subdirectories in these directories from anywhere
cdpath=(. .. ~/tombruijn ~/tombruijn/projects ~/tombruijn/writing ~/appsignal ~/projects/rubynl ~/projects)

## Enable Elixir IEX history
export ERL_AFLAGS="-kernel shell_history enabled"

## Disable Homebrew analytics
export HOMEBREW_NO_ANALYTICS=1

## Load private credentials from ~/.extra file
if [ -f ~/.extra ]; then
  source ~/.extra
fi

###############################################################################
# Load additional configuration

ZSH_DIR="$HOME/.zsh" # Path to my custom ZSH directory

source "$ZSH_DIR/history.zsh"
source "$ZSH_DIR/key-bindings.zsh"
source "$ZSH_DIR/completions.zsh"
source "$ZSH_DIR/functions.zsh"
source "$ZSH_DIR/aliases.zsh"

# Theme
source "$ZSH_DIR/theme.zsh"
source "$ZSH_DIR/termsupport.zsh"

###############################################################################
# Load tools

## Configure GPG
export GPG_TTY=$(tty)

## Load FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden'

## Load chruby version manager + auto detection
if [ -d /opt/homebrew/opt/chruby/share/chruby/ ]; then
  # New homebrew install location
  source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
  source /opt/homebrew/opt/chruby/share/chruby/auto.sh
else
  # Remove this when all laptops have the new homebrew file structure
  source /usr/local/opt/chruby/share/chruby/chruby.sh
  source /usr/local/opt/chruby/share/chruby/auto.sh
fi

## Load ASDF version manager
if [ -d $HOME/.asdf ]; then
  . $HOME/.asdf/asdf.sh
fi

export DISABLE_LIVE_RELOADING=true

if command -v pyenv >/dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi
