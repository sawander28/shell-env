
# Set terminal title
PS1='\[\033]0;\u@\h:\w\007'

# Set prompt
if (( $EUID == 0 )); then
  PS1+='\[\033[01;33m\]\h\[\033[01;36m\] \w \$\[\033[00m\] '

elif [ -f /usr/share/git/git-prompt.sh ]; then
  . /usr/share/git/git-prompt.sh
  PS1+='\[\e[01;33m\]\u@\h\[\e[1m\]$(__git_ps1 " (%s)")\[\e[01;36m\] \W \$\[\e[00m\] '
else
  PS1='[\u@\h \W]\$ '
fi
