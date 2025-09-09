# Abort when no rust binary or manual install found
command -v rustc >/dev/null 2>&1 || test -d ~/.cargo || return

. ~/lib/functions.sh

export CARGO_HOME=$HOME/.cargo
prepend_path ${CARGO_HOME}/bin

