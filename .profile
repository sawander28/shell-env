export LANG=en_US.UTF-8
export LC_COLLATE=C
export EDITOR=vim
export PAGER=less

# Runit user services
export SVDIR=$HOME/service
export PATH=~/bin:/usr/local/bin:/usr/bin

: ${XDG_RUNTIME_DIR:=/run/user/$(id -u)}
: ${DBUS_SESSION_BUS_ADDRESS:=unix:path=$XDG_RUNTIME_DIR/bus}
export XDG_RUNTIME_DIR DBUS_SESSION_BUS_ADDRESS
export XDG_DESKTOP_SESSION=sway
export XDG_SESSION_TYPE=wayland

if [ -d ~/.profile.d ]; then
  for sh in ~/.profile.d/*.sh; do
    [ -r $sh ] && . $sh
  done
  unset sh
fi

[ -f ~/.bashrc ] && . ~/.bashrc
