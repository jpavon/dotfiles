cd "$(dirname "$0")"

function doIt() {
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" -av . ~
}

doIt

unset doIt
source ~/.bash_profile
