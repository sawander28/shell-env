# dircolors.zsh

(( $+commands[dircolors] )) && {
    if [[ -r "${XDG_CONFIG_HOME}/dir_colors" ]] {
        eval $(dircolors -b ${XDG_CONFIG_HOME}/dir_colors)
    } elif [[ -r "/etc/DIR_COLORS" ]] {
        eval $(dircolors -b /etc/DIR_COLORS)
    } else { eval $(dircolors -b) }
}
