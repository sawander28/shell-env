export GCC_COLORS="error=01;31:warning=01;35:locus=01:quote=01:path=01;36"
export CCACHE_HOME="$XDG_CACHE_HOME/ccache"
export MAKEOPTS="^-j$(($(getconf _NPROCESSORS_ONLN)+1)) --no-print-directory"
