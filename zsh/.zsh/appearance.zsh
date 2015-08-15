# Activate colors
export TERM=xterm-256color
autoload colors
colors
BASE16_SHELL="$HOME/.zsh/colors.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Set ls colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"
ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'
