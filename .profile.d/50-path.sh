# export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin

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
prependpath "${GOPATH}/bin"
prependpath "${CARGO_HOME}/bin"
prependpath "${HOME}/bin"
unset prependpath
export PATH
