# export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

path(){
  printf "${PATH}\n"
}

prependpath () {
  case ":$PATH:" in
    *":$1:"*) ;;
           *) PATH="$1${PATH:+:$PATH}";;
  esac
}

PATH=""
#prependpath "/sbin"
#prependpath "/bin"
#prependpath "/usr/sbin"
prependpath "/usr/bin"
#prependpath "/usr/local/lobase/sbin"
#prependpath "/usr/local/lobase/bin"
prependpath "/usr/local/sbin"
prependpath "/usr/local/bin"
prependpath "${GOPATH}/bin"
prependpath "${HOME}/.cargo/bin"
prependpath "${HOME}/bin"
unset prependpath
export PATH
