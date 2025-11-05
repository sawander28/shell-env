# 15-zsh-syntax-highlighting.zsh

zsh_syntax_highlighting () {
  . /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh NIL || return
}

is-at-least 4.3.9 && zsh_syntax_highlighting
