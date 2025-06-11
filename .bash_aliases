
for cmd in diff egrep fgrep grep ip ls; do
	alias $cmd="$cmd --color=auto"
done

alias ll='ls -lh'
alias la='ls -a'
alias  l='ls -lha'
alias l.='ls -d .*'
alias df='df -h'
alias ds='du -sh'
alias free='free -h'
alias cls='clear'
alias res='cd ~ && reset'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

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

myip(){ dig +short myip.opendns.com @resolver1.opendns.com; }

my_ip(){ curl ipinfo.io/ip; }

curltls(){ curl --proto '=https' --tlsv1.2 -sSf "${@}"; }

finger_banner(){ curl -sL https://www.kernel.org/finger_banner; }
