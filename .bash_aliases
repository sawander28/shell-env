# -*- mode: sh -*-

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias ls='/usr/bin/ls --color=auto'
alias ip='ip --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ll='ls -lh'
alias la='ls -a'
alias  l='ls -lha'
alias l.='ls -d .*'
alias lsd='ls -d *$@*'
alias lad='ls -Ad .*$@*'
alias lsa='ls -Ad .*$@*'
alias lsn='ls -hrtl *$@* | tail'
alias lso='ls -hrtl *$@* | head'
alias lsl='ls -Alh'

alias cls=clear
alias md=mkdir
alias rd=rmdir
alias hi=history
alias mo=more
alias le=less
alias hl='history | less'
alias ct='tar -cvpf'
alias xt='tar -xvpf'
alias df='df -h'
alias free='free -h'
alias ds='du -sh'
alias res='cd ~ && tput clear'
alias pu=pushd
alias po=popd

# Tmux
alias tmux='tmux -S ${XDG_RUNTIME_DIR}/tmux.default'
alias tmls='tmux list-sessions'

# Git 
alias gcd='cd $(git rev-parse --show-toplevel)'
alias ga='git add .'
alias gaa='git add --all'
alias gr='git remote -v'
alias gst='git status'
alias gcm='git commit -m'
alias gpu='git push origin master'
alias gpl='git pull origin master'
alias grhh='git reset HEAD --hard'
alias gb='git branch -a'
alias gt='git tag -l'

#alias portscan="nmap -Pn"

# Some tiny functions

err() {
  errstr $?
}

myip(){
  curl ipinfo.io/ip
}

curltls(){
  curl --proto '=https' --tlsv1.2 -sSf "${@}"
}

alias vmls="sudo virsh list --all"
alias vmst="sudo virsh start $@"
alias vmsh="sudo virsh shutdown $@"
alias   vm="sudo virsh $@"
