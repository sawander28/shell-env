. /usr/local/lib/functions.sh

# -*- Go -*-
# Abort when no go binary or manual install found.
command -v go >/dev/null \
    | test -d /usr/local/go \
    | return
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
prepend_path ${GOROOT}/bin
prepend_path ${GOPATH}/bin
