umask 022

[[ $- != *i* ]] && return   # don't do anything, if not interactively!

if [ -f /usr/share/git/git-prompt.sh ]; then
    . /usr/share/git/git-prompt.sh
    PS1='\[\e]0;\u@\h:\w\007\[\e[01;32m\]\u@\h\[\e[00m\]$(__git_ps1 " (%s)")\[\e[01;34m\] \W \$\[\e[00m\] '
else
    PS1='[\u@\h \W]\$ '
fi

if [ -d ~/.bashrc.d ]; then
    for sh in ~/.bashrc.d/*.sh; do
        [ -r $sh ] && . $sh
    done
    unset sh
fi

[ -f ~/.bash_aliases ] && . ~/.bash_aliases

export XAUTHORITY=~/.Xauthority
