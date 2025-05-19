
HISTCONTROL=ignoredups
HISTFILE=${XDG_CACHE_HOME}/bash_history
HISTFILESIZE=1000
HISTSIZE=1000

LESS="-R -M"
LESSHISTFILE="${XDG_CACHE_HOME}/less_history"
LESSOPEN=""

# bash-completion
complete -F _root_command doas
# Alternative that doesn't require app-shells/bash-completion
# However this doesn't complete arguments, among other things
#complete -cf doas
