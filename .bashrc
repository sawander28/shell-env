[[ $- != *i* ]] && return   # don't do anything, if not interactively!

umask 022

if [ -d ~/.bashrc.d ]; then
  for sh in ~/.bashrc.d/*.sh; do
    [ -r $sh ] && . $sh
  done
  unset sh
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

[ -f ~/.bash_aliases ] && . ~/.bash_aliases
