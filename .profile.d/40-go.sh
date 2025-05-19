
# Abort when command not exist
if command -v go >/dev/null 2>&1; then
    export GOPATH="$HOME/go"
else 
    printf "No go found in path\n"
fi

