# -*- mode sh -*-


#
# Common little POSIX helper functions adapted from Void Linux runit init-scripts
#


#
# Tiny logger
#

# MSG bold/white
msg(){ printf "\033[1m=> $@\033[m\n"; }

# OK bold/green
ok(){ printf "\033[1m\033[32m OK\033[m\n"; }

# WARN bold/yellow
warn(){ printf "\033[1m\033[33mWARNING: $@\033[m\n"; }

# ERROR bold/red
error(){ printf "\033[1m\033[31mERROR: $@\033[m\n"; }


#
# Starting emergency shell
#

emergency_shell(){
    echo
    echo "Cannot continue due to errors above, starting emergency shell."
    echo "When ready type exit to continue booting."
    /bin/sh -l
}


#
# Check if system is running in container or vm
#

detect_container(){
    # LXC, podman
    [ -z "${container+x}" ] || export IS_CONTAINER=1
    [ -e /.dockerenv ] && export IS_CONTAINER=1

    # backcompat
    [ -n "$IS_CONTAINER" ] && export VIRTUALIZATION=1
}


#
# Deactivate LVM2 volume group
#

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


#
# Deactivate dm-crypt volume
#

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

# vim:fenc=utf8 ft=sh ts=4 sts=4 sw=4 et
