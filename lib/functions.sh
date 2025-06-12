# -*- shell -*-
# vim: set fenc=utf-8  ts=4 sts=4 sw=4 et:

newline(){ printf "\n"; }

msg(){
    printf "\033[1m=> $@\033[m\n"
}

info(){
    printf "\033[1;32mINFO\033[0m ${*}\n"
}

warn(){
    printf "\033[1;33mWARNING\033[0m ${*}\n"
}

error(){
    printf "\033[1;31mERROR\033[0m ${*}\n" >&2
}

ok(){
    printf "\033[1m\033[32m OK\033[m\n"
}

die(){ 
    error "$@"
    exit "$?"
}

yesno(){
    case "$1" in
        Yes|Y|1|true) return 0 ;;
                   *) return 1 ;;
    esac
}

append_path(){
    case ":${PATH}:" in
    *":${1}:"*) ;;
             *)  PATH="${PATH:+$PATH:}$1";;
    esac
}

prepend_path(){
    case ":$PATH:" in
    *":$1:"*) ;;
           *) PATH="$1${PATH:+:$PATH}";;
    esac
}

datetime(){
    echo "$(date +'%Y%m%d_%H%M%S')"
}
