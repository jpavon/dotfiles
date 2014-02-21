for file in ~/.{bash_profile,functions,bashrc,zshrc,aliases,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file
