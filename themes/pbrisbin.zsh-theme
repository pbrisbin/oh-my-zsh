# vim: set ft=zsh:
#
# pbrisbin's theme, a tweaked version of zhann's.
#
###

PROMPT='%{$fg_bold[green]%}%p %{$fg[cyan]%}%c%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

return_code="%(?..%{$fg_bold[red]%}%? %{$reset_color%})"

if which rvm-prompt &>/dev/null; then
  RPROMPT='${return_code}%{$reset_color%} %{$fg_bold[grey]%}$(~/.rvm/bin/rvm-prompt i v g) %{$reset_color%}'
else
  RPROMPT='$(return_code)'
fi

SPROMPT="correct $fg_bold[red]%R$reset_color to $fg_bold[green]%r$reset_color [ynae]? "

ZSH_THEME_GIT_PROMPT_PREFIX=" (%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg_bold[yellow]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
