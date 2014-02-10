export PATH=/usr/local/bin:/usr/local/git/bin:/usr/bin/subl:/usr/local/bin/phantomjs:/Users/julio/Documents/rsync-backups:$PATH
export PATH="$(brew --prefix php55)/bin:$PATH"
# export PATH=/usr/local/bin:$PATH
# export NODE_PATH="/usr/local/lib/node_modules"


# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Make Sublime the default editor
# export EDITOR="s"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion




#
# Functions
#

# Push to beanstalk using grunt-shell
function gpush() {
	grunt push --message="$@"
}

# Create a new directory and enter it
function md() {
	mkdir -p "$@" && cd "$@"
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
	local port="${1:-8000}"
	sleep 1 && open "http://localhost:${port}/" &
	# Set the default Content-Type to `text/plain` instead of `application/octet-stream`
	# And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
	python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

# Start a PHP server from a directory, optionally specifying the port
# (Requires PHP 5.4.0+.)
function phpserver() {
	local port="${1:-4000}"
	local ip=$(ipconfig getifaddr en1)
	sleep 1 && open "http://${ip}:${port}/" &
	php -S "${ip}:${port}"
}
