for file in ~/.{bashrc,zshrc,aliases,bash_prompt}; do
	[ -r "$file" ] && source "$file"
done
unset file

export PATH=/usr/local/bin:$HOME/bin:/usr/local/Cellar/ruby/2.0.0-p0/bin:$PATH
# export PATH=/usr/local/bin:$PATH
# export NODE_PATH="/usr/local/lib/node_modules"

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Make Sublime the default editor
export EDITOR="subl"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Finder Dock Mail Safari iTunes iCal Address\ Book SystemUIServer" killall

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion









# Always use color output for `ls`
if [[ "$OSTYPE" =~ ^darwin ]]; then
	alias ls="command ls -G"
else
	alias ls="command ls --color"
	export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
fi





#
# Functions
#

# Create a new directory and enter it
function md() {
	mkdir -p "$@" && cd "$@"
}

# Styledocco
function sd() {
	styledocco -n ${1:-StyleGuide} --preprocessor "sass --compass"
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

function gh() {
	echo "co   = checkout"
	echo "ci   = commit"
	echo "st   = status"
	echo "b   = branch"
	echo "hist = log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short"
	echo "################################################################################"
	echo "l = log --pretty=oneline -n 20 --graph"
	echo "type = cat-file -t"
	echo "dump = cat-file -p"
	echo "################################################################################"
	echo "# View the current working tree status using the short format"
	echo "s = status -s"
	echo "################################################################################"
	echo "# Diff"
	echo "d = diff --patch-with-stat"
	echo "################################################################################"
	echo "# Pull in remote changes for the current repository and all its submodules"
	echo "p = !git pull; git submodule foreach git pull origin master"
	echo "################################################################################"
	echo "# Clone a repository including all submodules"
	echo "c = clone --recursive"
	echo "################################################################################"
	echo "# Commit all changes"
	echo "cam = !git add -A && git commit -am"
	echo "################################################################################"
	echo "# Switch to a branch, creating it if necessary"
	echo "go = checkout -B"
	echo "################################################################################"
	echo "# Undo a git push"
	echo "undopush = push -f origin HEAD^:master"
	echo "################################################################################"
	echo "# Git Reset Commit"
	echo "rst = reset --soft HEAD~1 "
}

