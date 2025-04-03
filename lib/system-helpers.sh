# -*- mode: sh -*-

# Tiny little system helper functions


# generate a random password using openssl to stdout
function genpwd {
	openssl rand -base64 48
}


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

# Mount/fstab info helper
mount-info(){
	local arg args fs src opts opt ret

	src=/proc/mounts
	args="$(getopt -o F:fo: -l fstab,fsys:,options: -n mount-info -s sh -- "${@}")"
	eval set -- ${args}

	while true; do
	case "${1}" in
		(-f|--fstab) src=/etc/fstab;;
		(-F|--fsys*) fs="${2}"; shift;;
		(-o|--options) opts="${2}"; shift;;
		(*) shift; break;;
	esac
	shift
	done

	arg="${1}"
	eval set -- $(sed -nre "s|(^[^#].*${1}[[:space:]].*${fs})[[:space:]].*$|\1|p" ${src})
	[ -z "${1}" ] && return 1

	if [ -n "${opts}" ]; then
		local IFS="${IFS},"
		for opt in ${opts}; do
			case "${opt}" in
				(*${4}*)  ;;
				(*) return 1;;
			esac
		done
	fi

	case "${arg}" in
		(${1}|${2}) return 0;;
	esac
	return 1
}


# Simple xev key code
xev-key-code(){
	xev | grep -A2 --line-buffered '^KeyRelease' | \
	sed -nre '/keycode /s/^.*keycode ([0-9]*).* (.*, (.*)).*$/\1 \2/p'
}


# paste function to http://sprunge.us
sprunge(){
	case "${1}" in
		(''|-) curl -F 'sprunge=<-' http://sprunge.us;;
		(*)
		local arg
		for arg; do
			[ -f "${arg}" ] || continue
			pr-info "Pasting... ${arg}"
			curl -F 'sprunge=<-' http://sprunge.us < "${arg}"
		done;;
	esac
}


# html search query
pkg-search(){
	local url="http://packages.gentoo.org/packages/search?description"
	case "${1}" in
		([a-zA-Z]*) curl -s "${url}=${1}" | html2text -nobs \
			| awk '/results for query/ { i=1 }; (i && $1 != "[Home]") { print }'
		;;
	esac
}


# Collect info about running kernel modules
mod-info(){
	local dir line conf mod{,s} info de null=/dev/null

	if [[ -n "$*" ]]; then
		mods=($*)
	else
		while read line; do
			mods+=( ${line%% *})
		done </proc/modules
	fi
	for mod in "${mods[@]}"; do
		dir=/sys/module/$mod/parameters
		[[ -d $dir ]] || continue
		info="$(modinfo -d $mod 2>$null)"
		echo -e "$mod${color[default]} :$(echo "$info" | tr '\n' '\t')"

		pushd $dir >$null 2>&1
		for conf in *; do
			echo -e "\t$conf=$(< $conf 2>$null) -$(echo "$info" | sed "/^$conf/s/^$conf=//" 2>$null)"
		done
		popd >$null 2>&1
	done
}


# colorful helper to retrieve Kernel Module Parameters
mod-info-color(){
	local line conf dir mod{,s} info null=/dev/null newline='
'
	if [[ -n "$*" ]]; then
		mods=($*)
	else
		while read line; do
			mods+=( ${line%% *})
		done </proc/modules
	fi
	for mod in ${mods[@]}; do
		dir=/sys/module/$mod/parameters
		[[ -d $dir ]] || continue
		info="$(modinfo -d $mod 2>$null | tr '\n' '\t')"
		echo -en "${fg[2]}$mod${color[none]}"
		(( ${#info} >= 0 )) && echo -e " - $info"

		declare -a names descs vals
		local add_desc=false desc name IFS="$newline"
		
		while read line; do
			if [[ "$line" =~ ^[[:space:]] ]]; then
				desc+="$newline	$line"
			else
				$add_desc && descs+=("$desc")
				name="${line%%:*}"
				names+=("$name")
				desc=("	${line#*:}")
				vals+=("$(< $dir/$name 2>$null)")
			fi
			add_desc=true
		done < <(modinfo -p $mod 2>$null)
		
		$add_desc && descs+=("$desc")
		for (( i=0; i<${#names[@]}; i++ )); do
			(( "${#names[i]}" > 0 )) || continue
			printf "\t${fg[6]}%s${color[none]} = ${fg[3]}%s${color[none]}\n%s\n" \
			${names[i]} \
			"${vals[i]}" \
			"${descs[i]}"
		done
		echo
	done
}

# vim:fenc=utf-8 ft=sh ts=4 sts=4 sw=4 et
