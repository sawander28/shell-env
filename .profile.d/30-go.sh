# Abort when go binary not available
command -v go >/dev/null 2>&1 || return

export GOPATH=$HOME/go
