
for cmd in diff dir grep ip ls vdir; do
  alias "$cmd=$cmd --color=auto"
done

if [ -f ~/.dircolors ]; then
  eval "$(dircolors -b -- ~/.dircolors)"
fi
