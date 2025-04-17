
# -*- color ls intialization -*-

# Skip for noninteractive shells
[ -z "$PS1" ] && return

COLORS=
for colors in "$HOME/.dircolors /etc/colors/DIR_COLORS.xterm; do
  [ -e "$colors" ] && COLORS="$colors" && break
done

# Existencee of COLORS already checked above
[ -n "$COLORS" ] || return

eval "$(dircolors -b -- $COLORS)"
