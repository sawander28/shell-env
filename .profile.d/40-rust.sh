# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Abort when no rust installation founnd
[ -d "$HOME/.cargo" ] || return

export CARGO_HOME=$HOME/.cargo
#. "$HOME/.cargo/env"
