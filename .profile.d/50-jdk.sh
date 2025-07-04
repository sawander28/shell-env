test -d /usr/lib/jvm/default-jdk || return

export JAVA_HOME="/usr/lib/jvm/default-jdk"
export MANPATH="$MANPATH:${JAVA_HOME}/man"
prepend_path "$JAVA_HOME/bin"
