# bash history
# don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth
HISTFILESIZE=2000
HISTSIZE=1000
HISTFILE=~/.cache/bash_history

# check window size after each command and, if necessary, update LINES & COLUMNS
shopt -s checkwinsize

complete -F _root_command doas
#complete -cf doas


