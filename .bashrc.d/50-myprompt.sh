
setup_gitprompt(){
. /usr/share/git/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE="true"
GIT_PS1_SHOWSTASHSTATE="$"
GIT_PS1_SHOWUNTRACKEDFILES="true"
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS="true"
GIT_PS1_HIDE_IF_PWD_IGNORED="true"
GIT_PS1_STATESEPARATOR="/"
GIT_PS1_COMPRESSSPARSESTATE="?"
GIT_PS1_DESCRIBE_STYLE="branch,describe,tag"

PS1+='\[\e[01;32m\]\u@\h\[\e[00m\]$(__git_ps1 " (%s)")\[\e[01;37m\] \W \$\[\e[00m\] '
}


# Set terminal title
PS1='\[\033]0;\u@\h:\w\007'

# Set prompt
if (( $EUID == 0 )); then
  # root prompt
  PS1+='\[\033[01;33m\]\h\[\033[01;36m\] \w \$\[\033[00m\] '

elif [ -f /usr/share/git/git-prompt.sh ]; then
  # git prompt
  setup_gitprompt  
else
  # fallback prompt
  PS1='[\u@\h \W]\$ '
fi
