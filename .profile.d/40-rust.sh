. /usr/local/lib/functions.sh

# -*- Rust -*-
# Abort when no rust binary or manual install found
command -v rustc >/dev/null \
    | test -d ~/.cargo \
    | return
export CARGO_HOME=$HOME/.cargo
prepend_path $CARGO_HOME/bin

