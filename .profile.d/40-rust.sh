# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
export CARGO_HOME=$HOME/.cargo
. "$HOME/.cargo/env"


# Rust cross-compiler for android devices (armv7/aarch64) & qemu emulators
# rustup target install \
#   armv7-linux-androideabi \
#	  aarch64-linux-android \
#	  i686-linux-android \
#	  x86_64-linux-android
