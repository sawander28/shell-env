
# Add element as first in PATH
prepend_path(){
  case ":$PATH:" in
    *":$1:"*) ;;
           *) PATH="$1${PATH:+:$PATH}";;
  esac
}

PATH=""
prepend_path "/usr/bin"
prepend_path "/usr/local/sbin"
prepend_path "/usr/local/bin"
[ -n "${GOPATH}" ] && prepend_path "${GOPATH}/bin"
[ -d "${HOME}/.rust" ] && prepend_path "${CARGO_HOME}/bin"
prepend_path "${HOME}/bin"
unset prepend_path
export PATH
