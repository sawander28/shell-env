# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Abort when no rust binary or manual installation found
command -v rustc >/dev/null 2>&1 || test -d ~/.cargo || return

export CARGO_HOME=$HOME/.cargo

