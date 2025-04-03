# ~/.profile wandsas 202502

# POSIX variables
# http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap08.html#tag_08_03
: ${LANG:=en_US.UTF-8}
: ${LC_COLLATE:=C}
export LANG LC_COLLATE

: ${SHELL:=bash}
: ${PAGER:=less}
: ${EDITOR:=vim}
: ${VISUAL:=vim}
: ${BROWSER:=chromium}
export SHELL PAGER EDITOR VISUAL BROWSER

# XDG path variables
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
: ${XDG_CONFIG_HOME:=$HOME/.config}
: ${XDG_CACHE_HOME:=$HOME/.cache}
: ${XDG_DATA_HOME:=$HOME/.local/share}
: ${XDG_RUNTIME_DIR:=/run/user/$(id -u)}
export XDG_CONFIG_HOME XDG_CACHE_HOME XDG_DATA_HOME XDG_RUNTIME_DIR

# XDG system path variable
# https://standards.freedesktop.org/icon-theme-spec/icon-theme-spec-latest.html
export XDG_DATA_DIRS=${XDG_DATA_HOME}:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}

# Required for dbus/xdg-dekstop-portal session
: ${XDG_CURRENT_DESKTOP:=sway}
: ${XDG_SESSION_DESKTOP:=sway}
: ${XDG_SESSION_TYPE:=wayland}
: ${XCURSOR_THEME:=plan9}
: ${XCURSOR_SIZE:=24}
export XDG_CURRENT_DESKTOP XDG_SESSION_DESKTOP XDG_SESSION_TYPE XCURSOR_NAME XCURSOR_SIZE

: ${DBUS_SESSION_BUS_ADDRESS:=unix:path=${XDG_RUNTIME_DIR}/bus}
export DBUS_SESSION_BUS_ADDRESS

: ${SVDIR:=$HOME/service}
export SVDIR

export WHOME="/home/wandsas"
export WENV="${XDG_RUNTIME_DIR}/env"

if [ -d ~/.profile.d ]; then
  for sh in ~/.profile.d/*.sh; do
    [ -r $sh ] && . $sh
  done
  unset sh
fi

[ -n $BASH_VERSION ] && [ -f ~/.bashrc ] && . ~/.bashrc
