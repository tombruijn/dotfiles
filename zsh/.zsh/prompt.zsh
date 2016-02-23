# Allow prompt parameter expansion
setopt PROMPT_SUBST

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%} %{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[green]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}▪%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='%{$fg[green]%}%2~$(git_custom_status) %(?.%{$fg[blue]%}.%{$fg[red]%})› %{$reset_color%}'
RPS1=''
