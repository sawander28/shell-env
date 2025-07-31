# Abort when no go binary or manual install found
command -v go >/dev/null 2>&1 || test -d /usr/local/go || return

export GOROOT=/usr/local/go
export GOPATH=/home/wandsas/go
prepend_path ${GOROOT}/bin
prepend_path ${GOPATH}/bin
