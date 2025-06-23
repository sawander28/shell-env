test -d /usr/lib/jvm/default-jdk || return

export JAVA_HOME="/usr/lib/jvm/default-jdk"
prepend_path "$JAVA_HOME/bin"
export MANPATH="$MANPATH:${JAVA_HOME}/man"
