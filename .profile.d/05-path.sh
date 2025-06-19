
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
prependpath "${HOME}/.local/bin"
prependpath "${HOME}/bin"
unset prependpath
export PATH
