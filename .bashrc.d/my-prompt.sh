
[ $EUID == 0 ] && return

[ -f /usr/share/git/git-prompt.sh ] || return
. /usr/share/git/git-prompt.sh

#if [ ! -f ~/.bashrc.d/git-prompt.sh ]; then
#  curl -sLOf ~/.bashrc.d/git-prompt.sh --create-dirs \
#    "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh"
#fi

# Overridable by bash.showDirtyState=true
GIT_PS1_SHOWDIRTYSTATE="true"
# If something is stashed #
# A $ will be shown next to the branch name, if something is stashed.
GIT_PS1_SHOWSTASHSTATE="$"
GIT_PS1_SHOWUNTRACKEDFILES="true"
# Overridable by bash.showUpstream=auto
# Auto or comma separated list of: verbose, name, legacy, git, svn 
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS="true"
GIT_PS1_HIDE_IF_PWD_IGNORED="true"
GIT_PS1_STATESEPARATOR="/"
# if there is an in-progress operation (merge, rebase) running,
# ==> '|OPERATION-NAME' included.
# ==> '|SPARSE' included for sparse-checkout.
GIT_PS1_COMPRESSSPARSESTATE="?"
#GIT_PS1_OMITSPARSESTATE=
# options: contains, branch, describe, tag, default 
GIT_PS1_DESCRIBE_STYLE="branch,describe,tag"

# Title
PS1='\[\033]0;\u@\h:\w\007'
# Prompt
PS1+='\[\033[01;32m\]\u@\h\[\033[00m\]$(__git_ps1 " (%s)") \[\033[0;37m\]\W \$\[\033[00m\] '
