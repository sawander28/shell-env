# keybindings.zsh
zmodload zsh/terminfo

# 'ctrl+p' paste, 'ctrl+y' copy
function copy-to-clipboard {
	[[ -n "${LBUFFER}${RBUFFER}" ]] && echo ${LBUFFER}${RBUFFER} | xclip -i
}
function paste-from-clipboard {
	CLIPOUT=$(xclip -o)
	BUFFER=${LBUFFER}${CLIPOUT}${RBUFFER}
}
zle -N paste-from-clipboard
zle -N copy-to-clipboard
bindkey "\C-P" paste-from-clipboard
bindkey "\C-Y" copy-to-clipboard

# 'ctrl+z' to add sudo before existing command
function sudo-command-line () {
    [[ -z $BUFFER ]] && zle up-history
    if [[ $BUFFER != sudo\ * ]]; then
        BUFFER="sudo $BUFFER"
        CURSOR=$(( CURSOR+5 ))
    fi
}
zle -N sudo-command-line
bindkey '^z' sudo-command-line

# 'ctrl-g' to list ghq repositories
function peco-ghq () {
    local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-ghq
bindkey '^g' peco-ghq

# 'ctrl-x d' to insert the actual date in the form yyyy-mm-dd
function insert-datestamp () { LBUFFER+=${(%):-'%D{%Y-%m-%d}'}; }
zle -N insert-datestamp
bindkey '^xd' insert-datestamp

#
# Zsh keybindings
#

typeset -A key
key=(
    BackSpace  "${terminfo[kbs]}"
    Home       "${terminfo[khome]}"
    End        "${terminfo[kend]}"
    Insert     "${terminfo[kich1]}"
    Delete     "${terminfo[kdch1]}"
    Up         "${terminfo[kcuu1]}"
    Down       "${terminfo[kcud1]}"
    Left       "${terminfo[kcub1]}"
    Right      "${terminfo[kcuf1]}"
    PageUp     "${terminfo[kpp]}"
    PageDown   "${terminfo[knp]}"
)

function bind2maps () {
    local i sequence widget
    local -a maps

    while [[ "$1" != "--" ]]; do
        maps+=( "$1" )
        shift
    done
    shift

    sequence="${key[$1]}"
    widget="$2"

    [[ -z "$sequence" ]] && return 1

    for i in "${maps[@]}"; do
        bindkey -M "$i" "$sequence" "$widget"
    done
}

bind2maps       viins       -- BackSpace   vi-backward-delete-char
bind2maps             vicmd -- BackSpace   vi-backward-char
bind2maps       viins vicmd -- Home        vi-beginning-of-line
bind2maps       viins vicmd -- End         vi-end-of-line
bind2maps 		viins       -- Insert      overwrite-mode
bind2maps             vicmd -- Insert      vi-insert
bind2maps       viins vicmd -- Delete      vi-delete-char
bind2maps 		viins vicmd -- Up          up-line-or-history
bind2maps 		viins vicmd -- Down        down-line-or-history
bind2maps       viins vicmd -- Left        vi-backward-char
bind2maps       viins vicmd -- Right       vi-forward-char

bindkey "\E[Z" reverse-menu-complete
bindkey "\C-L"  clear-screen
#bindkey "\C-Xl" screenclearx

bindkey -M vicmd "ga" what-cursor-position
bindkey -M viins "\E\C-R" redisplay
#bindkey -M vicmd "\C-R" redisplay2
bindkey -M vicmd "c" vi-change
bindkey -M vicmd "C" vi-change-eol
bindkey -M vicmd "S" vi-change-whole-line
bindkey -M vicmd "s" vi-substitute
bindkey -M vicmd "g~" vi-oper-swap-case

# Make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        emulate -L zsh
        printf '%s' ${terminfo[smkx]}
    }
    function zle-line-finish () {
        emulate -L zsh
        printf '%s' ${terminfo[rmkx]}
    }
    zle -N zle-line-init
    zle -N zle-line-finish
else
    for i in {s,r}mkx; do
        (( ${+terminfo[$i]} )) || debian_missing_features+=($i)
    done
    unset i
fi

#
# Enhanced vi-mode
#

bindkey -v


# history-substring-search up/down
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# history-substring-search vi k/j
bindkey -M vicmd 'k' history-beginning-search-backward
bindkey -M vicmd 'j' history-beginning-search-forward

# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
bindkey '^P' up-history
bindkey '^N' down-history

# allow ctrl-h, ctrl-w, ctrl-? for char and word deletion (standard behaviour)
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word

# allow ctrl-r to perform backward search in history
bindkey '^r' history-incremental-search-backward

# allow ctrl-a and ctrl-e to move to beginning/end of line
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# Incremental search is elite!
bindkey -M vicmd "/" history-incremental-search-backward
bindkey -M vicmd "?" history-incremental-search-forward

# Search based on what you typed in already
bindkey -M vicmd "//" history-beginning-search-backward
bindkey -M vicmd "??" history-beginning-search-forward

bindkey "\eOP" run-help

# oh wow!  This is killer...  try it!
bindkey -M vicmd "q" push-line

# it's like, space AND completion.  Gnarlbot.
bindkey -M viins ' ' magic-space

unfunction bind2maps
