# -*- mode: sh -*-

# Some convenient path helper functions


# Add element as first in PATH
prepend_path(){
  case ":$PATH:" in
    *":$1:"*) ;;
           *) PATH="$1${PATH:+:$PATH}";;
  esac
}

# PATH=
# prepend_path /usr/local/sbin
# prepend_path /usr/local/bin
# prepend_path /usr/sbin
# prepend_path /usr/bin
# prepend_path /sbin
# prepend_path /bin
# prepend_path $HOME/.local/bin
# prepend_path $HOME/bin
# unset prepend_path
# export PATH


# Add element as last element to PATH
append_path(){
  case ":${PATH}:" in
  *":${1}:"*) ;;
  *         )  PATH="${PATH:+$PATH:}$1"
  esac
}


# Default  PATH
path(){
for x in \
  "$HOME/bin" \
  "/usr/local/bin" \
  "/usr/local/sbin" \
  "/usr/bin" \
  "/usr/sbin" \
  "/bin" \
  "/sbin" \
  ; do
  [ -d "$x" ] || continue 
	case ":${PATH}:" in
	*":${x}:"*) ;;
	*) PATH="${PATH+${PATH}:}${x}" ;;
	esac
done
}


# Set minimal PATH
_path(){
for x in \
	"$HOME/bin" \
	"/usr/local/bin" \
    "/usr/local/sbin" \
	"/usr/bin" \
	; do
	[ -d "$x" ] || continue
	case ":${PATH}:" in
	*":${x}:"*) ;;
	*) PATH="${PATH+${PATH}:}${x}" ;;
	esac
done
}


# default
defaultpath(){
  export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
}

remove_path() {
   local p d
   p=":$1:"
   d=":$PATH:"
   d=${d//$p/:}
   d=${d/#:/}
   PATH=${d/%:/}
}

# vim: fenc=utf-8 ft=sh ts=4 sts=4 sw=4
