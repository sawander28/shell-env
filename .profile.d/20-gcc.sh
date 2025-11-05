# -*- GNU/GCC -*-
export MAKEOPTS="^-j$(($(getconf _NPROCESSORS_ONLN)+1)) --no-print-directory":w:
export GCC_COLORS="error=01;31:warning=01;35:locus=01:quote=01:path=01;36"
export CCACHE_HOME=/srv/nfs/ccache
# -*- pkgconf -*-
PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/share/pkgconfig
export PKG_CONFIG_PATH
