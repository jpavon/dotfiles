for file in ~/.{bash_profile,bashrc,zshrc,aliases}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file
