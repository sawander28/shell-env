[[ $- != *i* ]] && return   # don't do anything, if not interactively!

umask 022

# Set terminal title
PS1='\[\033]0;\u@\h:\w\007'

# Set prompt
if [ $EUID == 0 ]; then
  PS1+='\[\033[01;31m\]\h\[\033[01;34m\] \w \$\[\033[00m\] '
elif [ $(id -un) = git ]; then
  PS1+=' \h \W \$ '
else
  PS1+='\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[0;37m\]\W \$\[\033[00m\] '
fi

alias ip='ip --color=auto'
alias grep='grep --color=auto'
alias ls='/usr/bin/ls --color=auto'
alias ll='ls -lh'
alias la='ls -a'
alias  l='ls -lha'
alias df='df -h'
alias free='free -h'
alias ds='du -sh'
alias cls='tput clear'

if [ -d ~/.bashrc.d ]; then
  for sh in ~/.bashrc.d/*.sh; do
    [ -r $sh ] && . $sh
  done
  unset sh
fi

[ -f ~/.aliasrc ] && . ~/.aliasrc
