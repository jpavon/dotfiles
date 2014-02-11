cd "$(dirname "$0")"

function doIt() {
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "sync.sh" --exclude ".osx" --exclude "README.md" -av . ~
}

doIt

unset doIt

# Reload shell
exec $SHELL -l
