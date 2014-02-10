cd "$(dirname "$0")"

function doIt() {
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude ".osx" -av . ~
}

doIt

unset doIt
source ~/.zshrc
