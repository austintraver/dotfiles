() {
	typeset file=${XDG_CONFIG_HOME}/zsh/autosuggest/zsh-autosuggestions.zsh
	if [[ ! -r ${file} ]]; then
		print -P "%x:%I: no such file or directory: ${file}"
		return 1
	else
		typeset -gx ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=7"
		typeset -gxa ZSH_AUTOSUGGEST_STRATEGY=(completion)
		source ${file}
	fi
}
