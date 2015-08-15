# Source for some of this:
# https://github.com/robbyrussell/oh-my-zsh/blob/192de6bcffb0294e19f4203f6f7dc1a7f3e427be/lib/completion.zsh

autoload -U compinit
compinit -i
zmodload -i zsh/complist

# case-insensitive (all),partial-word and then substring completion
if [ "x$CASE_SENSITIVE" = "xtrue" ]; then
  zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
  unset CASE_SENSITIVE
else
  if [ "x$HYPHEN_INSENSITIVE" = "xtrue" ]; then
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
    unset HYPHEN_INSENSITIVE
  else
    zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
  fi
fi

zstyle ':completion:*:*:*:*:*' menu select

# don't prompt for a huge list use a page or menu
# Source: https://github.com/twe4ked/dotfiles/blob/b97d56982fe93f732e8cd355a2772a261e82addd/shell/zsh/completion.zsh#L22
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

# kill - show list of processes
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:kill:*:processes' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"

# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH/cache/
