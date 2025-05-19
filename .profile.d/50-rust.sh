# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

if [ -d ~/.cargo ]; then
    export CARGO_HOME="$HOME/.cargo"
    . "$CARGO_HOME/env"
else
    printf "No rust installation found in ~/.cargo\n"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

