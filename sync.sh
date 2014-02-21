cd "$(dirname "$0")"

function doIt() {
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "sync.sh" --exclude ".osx" --exclude "README.md" -av . ~
}
doIt
unset doIt

# Go back to previous directory
cd -

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo "  Sync done."
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

# Reload shell
exec $SHELL -l
