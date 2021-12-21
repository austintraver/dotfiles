if [[ ! -r ${XDG_CONFIG_HOME}/zsh/highlight/zsh-syntax-highlighting.zsh ]] {
	print -Pn '%x:%I: no such file or directory: ' >&2
	print -n "\"${XDG_CONFIG_HOME}/zsh/highlight/zsh-syntax-highlighting.zsh\"" >&2
	print "cannot be found." >&2
	return 1
}

typeset -gxa ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# # Declare the variable
typeset -gxA ZSH_HIGHLIGHT_STYLES=(
	[command]="fg=4"
	[function]="fg=3"
	[builtin]="fg=2"
	[alias]="fg=3"
	[path]="underline,fg=4"
	[comment]="fg=6"
	[assign]="none"
	[redirection]="bold"
	[numeric-fd]="fg=3"
	[command-substitution-delimiter]="bold,fg=4"
	[isearch]="fg=3"
	[path_pathseparator]="bold,fg=7"
	[dollar-double-quoted-argument]="bold"
	[single-quoted-argument]="fg=2"
	[double-quoted-argument]="fg=2"
	[back-dollar-quoted-argument]="fg=6"
	[back-double-quoted-argument]="fg=6"
	[single-hyphen-option]="fg=4"
	[double-hyphen-option]="fg=1"
	[bracket-level-1]="bold,fg=4"
	[bracket-level-2]="bold,fg=5"
	[bracket-level-3]="bold,fg=6"
	[bracket-level-4]="bold,fg=7"
)

source ${XDG_CONFIG_HOME}/zsh/highlight/zsh-syntax-highlighting.zsh || {
	unset ZSH_HIGHLIGHT_HIGHLIGHTERS
	unset ZSH_HIGHLIGHT_STYLES
}
