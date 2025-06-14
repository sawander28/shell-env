
prependpath () {
  case ":$PATH:" in
    *":$1:"*) ;;
           *) PATH="$1${PATH:+:$PATH}";;
  esac
}

PATH=""
prependpath "/usr/bin"
prependpath "/usr/local/sbin"
prependpath "/usr/local/bin"
[ -n "${GOPATH}" ]     && prependpath "${GOPATH}/bin"
[ -n "${CARGO_HOME}" ] && prependpath "${CARGO_HOME}/bin"
[ -n "${HOME}/perl5" ] && prependpath "${HOME}/perl5/bin"
[ -n "${JAVA_HOME}" ] && prependpath "${JAVA_HOME}/bin"
prependpath "${HOME}/.local/bin"
prependpath "${HOME}/bin"
unset prependpath
export PATH
