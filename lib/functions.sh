# -*- mode sh -*-


# ANSI escape sequences

reset='\033[0m' bold='1' italic='3' underline='4' blink='5' fastblink='6'
# Regular
black='\033[0;30m' red='\033[0;31m'    green='\033[0;32m'  yellow='\033[0;33m'
blue='\033[0;34m'  purple='\033[0;35m' cyan='\033[0;36m'   white='\033[0;37m'
# Bold
boblack='\033[1;30m' bored='\033[1;31m' bogreen='\033[1;32m' boyellow='\033[1;33m'
boblue='\033[1;34m' bopurple='\033[1;35m' bocyan='\033[1;36m' bowhite='\033[1;37m'


# Tiny little loggers

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

# vim: fenc=utf-8 ft=sh ts=2 sts=2 sw=2 et
