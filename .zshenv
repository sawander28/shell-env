
: ${ZDOTDIR:=$HOME}
export ZDOTDIR

# Stop bad system-wide scripts interfering.
setopt NO_global_rcs
setopt extended_glob

# Path
typeset -U PATH path
export PATH

path=(
    $ZDOTDIR/bin
    /usr/local/{bin,sbin}
    $path
    )

# Manpath
typeset -U manpath
export MANPATH

# Infopath
typeset -U infopath
export INFOPATH

# Libraries

# LD_LIBRARY_PATH
typeset -TU LD_LIBRARY_PATH ld_library_path

# Perl libraries
typeset -TU PERL5LIB perl5lib

# Fpath
fpath=(
    ${ZDOTDIR}/{.zsh/{${ZSH_VERSION}/*.zwc,functions},.local/share/zsh/site-functions}(N)
    $fpath
    )

for dirname in $fpath; do
    case "$dirname" in
	(${ZDOTDIR}/.zsh*) fns=( $dirname/*~*~(-N.x:t) ) ;;
	              i*) fns=( $dirname/*~*~(-N.:t ) ) ;;
    esac
    (( $#fns )) && autoload "$fns[@]"
done
