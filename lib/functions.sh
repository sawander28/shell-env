# *-*-shell-*-*
# vim: set fenc=utf-8  ts=4 sts=4 sw=4 et:

msg(){
    printf "\033[1m=> $@\033[m\n"
}

info(){
  printf " \033[1;32m*\033[0m ${*}\n"
}

warn(){
  printf " \033[1;33m*\033[0m ${*}\n"
}

error(){
  printf " \033[1;31m*\033[0m ${*}\n" >&2
}

ok() {
    # bold/green
    printf "\033[1m\033[32m OK\033[m\n"
}

die(){ 
  error "$@"
  exit "$?"
}

# Yes/No helper
yesno(){
    case "$1" in
        Yes|Y|1|true) return 0 ;;
        *) return 1 ;;
    esac
}
