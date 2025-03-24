#     Complete arguments as if they were commands
#     (eg: `doas emer<tab>` -> `doas emerge`)
#     (eg: `doas dd status=p<tab>` -> `doas dd status=progress`)
#    Complete arguments as if they were directory names (default behavior)
#     (eg: `doas /bi<tab>` -> `doas /bin/`)
# If you have app-shells/bash-completion installed
complete -F _root_command doas
# Alternative that doesn't require app-shells/bash-completion
# However this doesn't complete arguments, among other things
#complete -cf doas
