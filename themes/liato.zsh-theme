# My Custom super Clean Z-Shell Theme made by me Liato aka Liatoast!
# Absolutely no Requirements needed to use this Theme.
# Github Repo: https://github.com/Liatori-GR/ohmyzsh

prompt_setup_liato(){
  setopt localoptions extendedglob

  ZSH_THEME_GIT_PROMPT_PREFIX=" [%{$reset_color%}%{$fg[yellow]%}GIT%{$reset_color%}|%{$fg[green]%}"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}%{$reset_color%}]"
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  base_prompt='%{$fg[cyan]%}%n% %{$fg[green]%}@%{$fg[yellow]%}%m% %{$reset_color%}:[%{$fg[cyan]%}%#%{$reset_color%}|%{$fg[cyan]%}%0~% %{$reset_color%}]'
  post_prompt='> '

  base_prompt_nocolor=${base_prompt//\%\{[^\}]##\}}
  post_prompt_nocolor=${post_prompt//\%\{[^\}]##\}}

  autoload -U add-zsh-hook
  add-zsh-hook precmd prompt_liato_precmd
}

prompt_liato_precmd(){
  setopt localoptions extendedglob

  local gitinfo=$(git_prompt_info)
  local gitinfo_nocolor=${gitinfo//\%\{[^\}]##\}}
  local exp_nocolor="$(print -P \"$base_prompt_nocolor$gitinfo_nocolor$post_prompt_nocolor\")"
  local prompt_length=${#exp_nocolor}

  PROMPT="${base_prompt}${gitinfo}${post_prompt}"
}

prompt_setup_liato
