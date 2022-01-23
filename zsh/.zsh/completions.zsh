# Source for some of this:
# https://github.com/robbyrussell/oh-my-zsh/blob/a600ab4b8578ca0a8e6c6dae0373033b9d8c201c/lib/completion.zsh

export FPATH="$HOME/.zsh/site-functions:${FPATH}"
if type brew &>/dev/null; then
  export FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

autoload -U compinit
compinit -i
zmodload -i zsh/complist

# Basic autocompletion
zstyle ':completion:*:*:*:*:*' menu select
# Case-insensitive (all), partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# Don't prompt for a huge list use a page or menu
# Source: https://github.com/twe4ked/dotfiles/blob/b97d56982fe93f732e8cd355a2772a261e82addd/shell/zsh/completion.zsh#L22
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*:default' menu 'select=0'

# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_DIR/.cache/

# # Disable named-directories autocompletion
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
