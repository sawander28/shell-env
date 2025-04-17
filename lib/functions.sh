
# -*- Tiny little loggers -*-

einfo(){
  printf " \e[1;32m*\e[0m ${*}\n"
}

ewarn(){
  printf " \e[1;33m*\e[0m ${*}\n"
}

eerror(){
  printf " \e[1;31m*\e[0m ${*}\n" >&2
}

die(){ 
  eerror "$@"
  exit "$?"
}

# Yes/No helper
yesno(){
    case "$1" in
        Yes|Y|1|true) return 0 ;;
        *) return 1 ;;
    esac
}

# vim: fenc=utf-8 ft=sh ts=2 sts=2 sw=2 et
