for file in ~/.{functions,zshrc,aliases,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

export PATH=$(brew --prefix ruby)/bin:$PATH

export PATH="/usr/local/bin:$PATH"

export PATH="$HOME/bin:$PATH"

export PATH="$(brew --prefix php55)/bin:$PATH"

# Composer vendor dir
export PATH="vendor/bin:$PATH"

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Make Sublime the default editor
export EDITOR="subl"
