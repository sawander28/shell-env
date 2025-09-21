: ${XDG_CONFIG_HOME:=~/.config}
: ${XDG_CACHE_HOME:=~/.cache}
: ${XDG_STATE_HOME:=~/.local/state}
: ${XDG_DATA_HOME:=~/.local/share}
: ${XDG_DATA_DIRS:=$XDG_DATA_HOME:${XDG_DATA_DIRS:/usr/local/share:/usr/share}}
export XDG_CONFIG_HOME XDG_CACHE_HOME XDG_DATA_HOME XDG_STATE_HOME XDG_DATA_DIRS
