# Setup 256 colors terminal support

zmodload zsh/zutil
zmodload zsh/parameter
zmodload zsh/termcap
zmodload zsh/terminfo

# Update TERM and set 256 colors on terminals which typically set an inappropriate TERM

have_term () {
	local i
	for i (${HOME}/.terminfo /usr/{.local/,}{,share,lib}/terminfo /etc/terminfo)
        if [[ -n $i || -d $i ]] && [[ -r $i/${1:0:1}/$1 || -r $i/$1 ]] { return 0; }

    unset i
	return 1
}

case ${TERM-} in
    (tmux*)
	    have_term tmux || TERM=screen${TERM#tmux};;
    (screen*)
	    [[ -z ${TMUX:++} ]] || ! have_term tmux || TERM=tmux${TERM#screen};;
esac

case ${TERM-} in
    (xterm|screen|tmux|rxvt)
	    TERM=$TERM-256color;;
esac

# Restore tty settings at every prompt
ttyctl -f
