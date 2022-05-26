###############################################################################
# Color configuration
export TERM=xterm-256color
autoload colors
colors

## Set ls colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"
ls --color -d . &>/dev/null 2>&1 && alias ls='ls --color=tty' || alias ls='ls -G'

###############################################################################
# Git helper functions

## Show git branch/tag, or name-rev if on detached head
parse_git_branch() {
  (command git symbolic-ref -q HEAD || command git name-rev --name-only --no-undefined --always HEAD) 2>/dev/null
}

## Show icon when there are uncommitted changes
parse_git_dirty() {
  if command git diff-index --quiet HEAD 2> /dev/null; then
    echo "$ZSH_THEME_GIT_PROMPT_CLEAN"
  else
    echo "$ZSH_THEME_GIT_PROMPT_DIRTY"
  fi
}

## If in a git repo, show dirty indicator + git branch
git_custom_status() {
  local git_where="$(parse_git_branch)"
  [ -n "$git_where" ] && echo "$ZSH_THEME_GIT_PROMPT_PREFIX${git_where#(refs/heads/|tags/)}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX" || echo " "
}

###############################################################################
# Prompt definition

setopt PROMPT_SUBST # Allow prompt configuration

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{%B$fg[yellow]%}‑%B"
ZSH_THEME_GIT_PROMPT_CLEAN=" "
# Left hand side
PROMPT='%{$fg[blue]%}%2~$(git_custom_status)%(?.%{$fg[blue]%}.%{$fg[red]%})› %{$reset_color%}'
# Right hand side
RPS1=''
