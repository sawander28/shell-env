# bash history
# don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth
HISTFILESIZE=2000
HISTSIZE=1000
HISTFILE=${XDG_CACHE_HOME}/bash_history

# check window size after each command and, if necessary, update LINES & COLUMNS
shopt -s checkwinsize

# less history
LESS="-R -M"
LESSHISTFILE="${XDG_CACHE_HOME}/less_history"
LESSOPEN=""

# bash-completion
complete -F _root_command doas
# Alternative that doesn't require app-shells/bash-completion
# However this doesn't complete arguments, among other things
#complete -cf doas
