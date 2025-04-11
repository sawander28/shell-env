# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# for android 14 devices & qemu emulator 
# rustup target install \
#   armv7-linux-androideabi \
#	  aarch64-linux-android \
#	  i686-linux-android \
#	  x86_64-linux-android
# ndk @TODO
#	 export NDK_HOME=/<path/to/where/you/unzipped>/android-ndk-r22b/
export CARGO_HOME=$HOME/.cargo
