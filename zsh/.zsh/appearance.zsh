# Activate colors
autoload colors
colors

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
