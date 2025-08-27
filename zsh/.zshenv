# Base paths
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# Homebrew paths
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
# Rust paths
export PATH="$HOME/.cargo/bin:$PATH"
. "$HOME/.cargo/env"
# MongoDB custom path
export PATH="/usr/local/opt/mongodb-community@3.6/bin:/opt/homebrew/opt/mongodb-community@3.6/bin:$PATH"
# PostgreSQL path
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
# asfd version manager
export ASDF_DATA_DIR="$HOME/.asdf"
export PATH="$ASDF_DATA_DIR/shims:$PATH"
# My helpers
export PATH="$HOME/.bin:$PATH"

# Configure GPG
export GPG_TTY=$(tty)

# Load FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden'

# Set language and encoding
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_COLLATE=C

# Tools to use
export EDITOR="nvim"
export PAGER="less"
export LESS="-R"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Configure shared config dir
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/.ripgreprc"
export _ZO_DATA_DIR="$XDG_DATA_HOME/zoxide"

# Enable Elixir IEX history
export ERL_AFLAGS="-kernel shell_history enabled"

# Disable Homebrew analytics
export HOMEBREW_NO_ANALYTICS=1

# pyenv config
if command -v pyenv >/dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# Load private credentials from ~/.extra file
if [ -f ~/.extra ]; then
  source ~/.extra
fi

# AppSignal server config
export DISABLE_LIVE_RELOADING=true
