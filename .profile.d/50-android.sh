. /usr/local/lib/functions.sh

# -*- Java Development Kit -*-
# Abort when binary found
test -d /usr/lib/jvm/default-jdk || return
export JAVA_HOME=/usr/lib/jvm/default-jdk
export MANPATH=$MANPATH:$JAVA_HOME/man
prepend_path $JAVA_HOME/bin

# -*- Android SDK -*-
export ANDROID_HOME=$HOME/android
export ANDROID_SDK_ROOT=$ANDROID_HOME
prepend_path $ANDROID_HOME/cmdline-tools/bin
prepend_path $ANDROID_HOME/platform-tools
