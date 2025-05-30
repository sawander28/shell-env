# Abort when no go binary or manual installation found
command -v go >/dev/null 2>&1 || test -d /usr/local/go || return

export GOPATH=/home/wandsas/go
