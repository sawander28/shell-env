#gpg-connect-agent reloadagent /bye >/dev/null 2>&1
#export GPG_TTY="$(tty)"
#export GPG_AGENT_INFO="$(gpgconf --list-dir agent-socket)"
#export SSH_AUTH_SOCK="$(gpgconf --list-dir agent-ssh-socket)"
#unset SSH_AGENT_PID
#gpg-connect-agent updatestartuptty /bye >/dev/null 2>&1
