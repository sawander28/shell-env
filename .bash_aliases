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

# git
alias gcd='cd $(git rev-parse --show-toplevel)'
alias ga='git add .'
alias gaa='git add --all'
alias gr='git remote -v'
alias gst='git status'
alias gcm='git commit -m'
alias gpu='git push origin main'
alias gpl='git pull origin main'
alias grhh='git reset HEAD --hard'
alias gb='git branch -a'
alias gt='git tag -l'

# nmap portscan
portscan(){ nmap -Pn $@; }

# my external ip (WAN)
myip(){ curl ipinfo.io/ip; }

# get linux kernel current release versions
finger_banner(){ curl -sL https://www.kernel.org/finger_banner; }

container_registry() { podman info -f json | jq '.registries[search]'; }
