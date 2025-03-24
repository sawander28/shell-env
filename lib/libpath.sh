# -*- mode: sh -*-


#
# Add element as first in PATH
#

prependpath(){
  case ":$PATH:" in
    *":$1:"*) ;;
           *) PATH="$1${PATH:+:$PATH}";;
  esac
}

# e.g:
# PATH=
# prependpath /usr/local/sbin
# prependpath /usr/local/bin
# prependpath /usr/sbin
# prependpath /usr/bin
# prependpath /sbin
# prependpath /bin
# prependpath $HOME/.local/bin
# prependpath $HOME/bin
# unset prependpath
# export PATH


#
# Add element as last element to PATH
#

appendpath(){
  case ":${PATH}:" in
  *":${1}:"*) ;;
  *         )  PATH="${PATH:+$PATH:}$1"
  esac
}


#
# Initial my-user's  PATH
#

initpath(){
for x in \
  "$HOME/bin" \
  "$HOME/.local/bin" \
  "/usr/local/sbin" \
  "/usr/local/bin" \
  "/usr/sbin" \
  "/usr/bin" \
  "/sbin" \
  "/bin" \
  ; do
  [ -d "$x" ] || continue 
	case ":${PATH}:" in
	*":${x}:"*) ;;
	*) PATH="${PATH+${PATH}:}${x}" ;;
	esac
done
}


#
# Initialize minimal PATH
#

minpath(){
for x in \
	"$HOME/bin" \
	"$HOME/.local/bin" \
	"/usr/local/sbin" \
  "/usr/local/bin" \
	"/usr/bin" \
	; do
	[ -d "$x" ] || continue
	case ":${PATH}:" in
	*":${x}:"*) ;;
	*) PATH="${PATH+${PATH}:}${x}" ;;
	esac
done
}


#
# Initialize default PATH
#

defaultpath(){
  export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
}


# vim: fenc=utf-8 ft=sh ts=4 sts=4 sw=4
