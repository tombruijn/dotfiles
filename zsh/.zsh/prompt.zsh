# Allow prompt parameter expansion
setopt PROMPT_SUBST

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}‑"
ZSH_THEME_GIT_PROMPT_CLEAN=" "

PROMPT='%{$fg[cyan]%}%2~$(git_custom_status)%(?.%{$fg[blue]%}.%{$fg[red]%})› %{$reset_color%}'
RPS1=''
