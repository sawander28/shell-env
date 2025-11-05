# gpg-conf --list-dirs
#          --list-components
#          --reload -R
#          --kill -K

reloadagent(){
    gpg-connect-agent reloadagent /bye >/dev/null 2>&1
}
updatestartuptty(){
    gpg-connect-agent updatestartuptty /bye >/dev/null 2>&1
}

reloadagent
export GPG_TTY="$(tty)"
export GPG_AGENT_INFO="$(gpgconf --list-dir agent-socket)"
export SSH_AUTH_SOCK="$(gpgconf --list-dir agent-ssh-socket)"
unset SSH_AGENT_PID
updatestartuptty
