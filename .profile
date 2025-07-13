# POSIX variables
# http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap08.html#tag_08_03
: ${LANG:=en_US.UTF-8}
: ${LC_COLLATE:=C}
export LANG LC_COLLATE
: ${EDITOR:=vim}
: ${VISUAL:=vim}
: ${PAGER:=less}
: ${BROWSER:=firefox}
export  EDITOR VISUAL PAGER BROWSER SYSTEMD_PAGER=

# XDG path variable
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
: ${XDG_CONFIG_HOME:=$HOME/.config}
: ${XDG_CACHE_HOME:=$HOME/.cache}
: ${XDG_DATA_HOME:=$HOME/.local/share}
: ${XDG_STATE_HOME:=$HOME/.local/state}
: ${XDG_RUNTIME_DIR:=/run/user/$(id -u)}
export XDG_CONFIG_HOME XDG_CACHE_HOME XDG_DATA_HOME XDG_STATE_HOME XDG_RUNTIME_DIR
# XDG system path variable
# https://standards.freedesktop.org/icon-theme-spec/icon-theme-spec-latest.html
export XDG_DATA_DIRS=${XDG_DATA_HOME}:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}
# Runit user services
: ${SVDIR:=$HOME/service}
export SVDIR
# Default user PATH
export PATH="~/bin:/usr/local/bin:/usr/local/sbin:/usr/bin"

if [ -d ~/.profile.d ]; then
  for sh in ~/.profile.d/*.sh; do
    [ -r $sh ] && . $sh
  done
  unset sh
fi

[ -n $BASH_VERSION ] && [ -f ~/.bashrc ] && . ~/.bashrc
