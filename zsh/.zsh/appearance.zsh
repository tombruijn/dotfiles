# Activate colors
export TERM=xterm-256color
autoload colors
colors
BASE16_SHELL="$HOME/.zsh/colors.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Set ls colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"

# Find the option for using colors in ls, depending on the version: Linux or BSD
if [[ "$(uname -s)" == "NetBSD" ]]; then
  # On NetBSD, test if "gls" (GNU ls) is installed (this one supports colors);
  # otherwise, leave ls as is, because NetBSD's ls doesn't support -G
  gls --color -d . &>/dev/null 2>&1 && alias ls='gls --color=tty'
else
  ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'
fi
