# 10-zsh-autosuggestions.zsh

zsh_autosuggestions () {
  . /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh NIL || return
}

is-at-least 4.3.11 && zsh_autosuggestions
