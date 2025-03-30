# -*- mode sh -*-

# ANSI escape sequences
reset='\033[0m' bold='1' italic='3' underline='4' blink='5' fastblink='6'
# Regular
black='\033[0;30m' red='\033[0;31m'    green='\033[0;32m'  yellow='\033[0;33m'
blue='\033[0;34m'  purple='\033[0;35m' cyan='\033[0;36m'   white='\033[0;37m'
# Bold
boblack='\033[1;30m' bored='\033[1;31m' bogreen='\033[1;32m' boyellow='\033[1;33m'
boblue='\033[1;34m' bopurple='\033[1;35m' bocyan='\033[1;36m' bowhite='\033[1;37m'

# Tiny lightweight loggers
# MSG bold/white
msg(){ printf "\033[1m=> $@\033[m\n"; }
# INFO bold/yellow
info(){ printf "\033[1m\033[33m=> $@\033[m\n"; }
# WARN bold/yellow
warn(){ printf "\033[1m\033[33mWARNING: $@\033[m\n"; }
# ERROR bold/red
error(){ printf "\033[1m\033[31mERROR: $@\033[m\n"; }
# OK bold/green
ok(){ printf "\033[1m\033[32m OK\033[m\n"; }


#
# Starting emergency shell
emergency_shell(){
    echo
    echo "Cannot continue due to errors above, starting emergency shell."
    echo "When ready type exit to continue booting."
    /bin/sh -l
}


# Check if system is running in container or vm
detect_container(){
    # LXC, podman
    [ -z "${container+x}" ] || export IS_CONTAINER=1
    [ -e /.dockerenv ] && export IS_CONTAINER=1

    # backcompat
    [ -n "$IS_CONTAINER" ] && export VIRTUALIZATION=1
}


# Deactivate LVM2 volume group
deactivate_vgs(){
    _group=${1:-All}
    if [ -x /sbin/vgchange -o -x /bin/vgchange ]; then
        vgs=$(vgs|wc -l)
        if [ $vgs -gt 0 ]; then
            msg "Deactivating $_group LVM Volume Groups..."
            vgchange -an
        fi
    fi
}


# Deactivate dm-crypt volume
deactivate_crypt(){
    if [ -x /sbin/dmsetup -o -x /bin/dmsetup ]; then
        msg "Deactivating Crypt Volumes"
        for v in $(dmsetup ls --target crypt \
            --exec "dmsetup info -c --noheadings -o open,name");
            do
                [ ${v%%:*} = "0" ] && cryptsetup close ${v##*:} && \
                    msg "[crypt] successfully closed: ${v##*:}"
            done
            deactivate_vgs "Crypt"
    fi
}

# Yes/No helper
yesno(){
	case "${1:-NO}" in
	(0|[Dd][Ii][Ss][Aa][Bb][Ll][Ee]|[Oo][Ff][Ff]|[Ff][Aa][Ll][Ss][Ee]|[Nn][Oo])
		return 1;;
	(1|[Ee][Nn][Aa][Bb][Ll][Ee]|[Oo][Nn]|[Tt][Rr][Uu][Ee]|[Yy][Ee][Ss])
		return 0;;
	(*)
		return 2;;
	esac
}

# vim: fenc=utf8 ft=sh ts=4 sts=4 sw=4 et
