test -d /srv/nfs/android/sdk || return 0

ANDROID_HOME=/srv/nfs/android/sdk
prepend_path $ANDROID_HOME/platform-tools

