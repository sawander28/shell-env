command -v javac >/dev/null 2>&1 || return

export JAVA_HOME="/usr/lib/jvm/default-jdk"
export MANPATH="$MANPATH:${JAVA_HOME}/man"
