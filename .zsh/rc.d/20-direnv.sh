#!/bin/zsh

# Skip noninteractive shells
[ -z "$PS1" ] && return

# Abort when command not exist
command -v direnv >/dev/null 2>&1 || return

eval "$(direnv hook zsh)"
