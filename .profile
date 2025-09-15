: ${LANG:=en_US.UTF-8}
: ${LC_COLLATE:=C}
export LANG LC_COLLATE
: ${EDITOR:=vim}
: ${VISUAL:=vim}
: ${PAGER:=less}
export  EDITOR VISUAL PAGER

: ${XDG_CONFIG_HOME:=$HOME/.config}
: ${XDG_CACHE_HOME:=$HOME/.cache}
: ${XDG_DATA_HOME:=$HOME/.local/share}
#: ${XDG_STATE_HOME:=$HOME/.local/state}
: ${XDG_RUNTIME_DIR:=/run/user/$(id -u)}
export XDG_CONFIG_HOME XDG_CACHE_HOME XDG_DATA_HOME XDG_STATE_HOME XDG_RUNTIME_DIR

#export XDG_DATA_DIRS=${XDG_DATA_HOME}:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}
export SVDIR=$HOME/service

# Default user PATH
export PATH="~/bin:~/.local/bin:/usr/local/bin:/usr/bin"

if [ -d ~/.profile.d ]; then
  for sh in ~/.profile.d/*.sh; do
    [ -r $sh ] && . $sh
  done
  unset sh
fi

[ -n $BASH_VERSION ] && [ -f ~/.bashrc ] && . ~/.bashrc
