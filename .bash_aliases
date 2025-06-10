# -*- mode: sh -*-

alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip --color=auto'
alias ls='/usr/bin/ls --color=auto'

alias ll='ls -lh'
alias la='ls -a'
alias  l='ls -lha'

alias df='df -h'
alias ds='du -sh'
alias free='free -h'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias ls='ls --color=auto'
alias ip='ip --color=auto'
alias diff='diff --color=auto'
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

alias hi=history
alias mo=more
alias le=less
alias hl='history | less'

alias cls=clear
alias res='cd ~ && tput clear'

# tmux
alias tmux='tmux -S ${XDG_RUNTIME_DIR}/tmux.default'
alias tmls='tmux list-sessions'

# git
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

# virsh
alias   vm="sudo virsh $@"
alias vmls="sudo virsh list --all"
alias vmstart="sudo virsh start $@"
alias vmshutdown="sudo virsh shutdown $@"

#alias portscan="nmap -Pn"


err() { errstr $?; }

myip(){ dig +short myip.opendns.com @resolver1.opendns.com; }

my_ip(){ curl ipinfo.io/ip; }

curltls(){ curl --proto '=https' --tlsv1.2 -sSf "${@}"; }

finger_banner(){ curl -sL https://www.kernel.org/finger_banner; }
