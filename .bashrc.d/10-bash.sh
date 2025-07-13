# don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth
HISTFILESIZE=2000
HISTSIZE=1000
HISTFILE=~/.cache/bash_history
# check window size after each command and optional update LINES & COLUMNS.
shopt -s checkwinsize
# doas bash-completion
complete -F _root_command doas
#complete -cf doas
# Syntax highlighted manual pages
man() {
  LESS_TERMCAP_mb=$(printf "\e[01;33m") \
  LESS_TERMCAP_md=$(printf "\e[01;33m") \
  LESS_TERMCAP_me=$(printf "\e[0m") \
  LESS_TERMCAP_se=$(printf "\e[0m") \
  LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
  LESS_TERMCAP_ue=$(printf "\e[0m") \
  LESS_TERMCAP_us=$(printf "\e[01;36m") \
  command man "$@"
}
# 
