
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

# nmap portscan
portscan(){ nmap -Pn $@; }

myip(){ curl ipinfo.io/ip; }
# curl -4 icanhazip.com
# curl ifconfig.me
# curl ipecho.net/plain

# TXT dns text record, resource record to associate arbitrary text with a host
myipv4(){ dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com; }

myipv6(){ dig -6 TXT +short o-o.myaddr.l.google.com @ns1.google.com; }

curltls(){ curl --proto '=https' --tlsv1.2 -sSf "${@}"; }

# Linux default Tor proxy port 9050
checktor(){ curl --socks5-hostname localhost:9050 https://check.torproject.org; }

# get linux kernel current release versions
finger_banner(){ curl -sL https://www.kernel.org/finger_banner; }
