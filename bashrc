# Exit if PowerShell is being sourced.
if (( __PWSH_LOGIN_CHECKED == 1 )); then
	return
fi

# Exit if we haven't configured for this OS yet.
if [[ ! $(uname) =~ (Darwin|Linux) ]]; then
  echo "non-Unix system detected: skipping .bashrc" >&2
  exit 1
fi

export XDG_CACHE_HOME=~/.cache
[[ ! -d "${XDG_CACHE_HOME}" ]] && mkdir -v "${XDG_CACHE_HOME}"
export XDG_DATA_HOME=~/.local/share
[[ ! -d "${XDG_DATA_HOME}" ]] && mkdir -v "${XDG_DATA_HOME}"
export XDG_CONFIG_HOME=~/.config

# Set the history file
export HISTFILE="${XDG_DATA_HOME}/bash/history"
if [[ ! -d "$(dirname ${HISTFILE})" ]]; then
	mkdir -v "$(dirname ${HISTFILE})"
fi

# Ignore duplicates in history
export HISTCONTROL='ignoreboth:erasedups'

# Configure the number of lines to write
export HISTFILESIZE=10000

# Configure the number of lines to remember
export HISTSIZE=1000

# Append history after a command is entered
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Disable bash sessions
export SHELL_SESSION_HISTORY=0

# Configure movement keys
export INPUTRC="${XDG_CONFIG_HOME}/inputrc"

# Attempt to `cd` to the value of a variable
# if the supplied directory is not found
shopt -s "cdable_vars"

# Include hidden files when performing filename expansion
shopt -s "dotglob"

# Include `?` `*` `+` `@` and `!` as glob characters
shopt -s "extglob"

# Append to history instead of overwriting it
shopt -s "histappend"

# Give the user a chance to re-edit a failed history substitution
shopt -s "histreedit"

# Preserve multi-line commands as a single entry in the history file
shopt -s "lithist"

# Perform case insensitive globbing during pathname expansion
shopt -s "nocaseglob"

# Perform case insensitive matching during conditional statements
shopt -s "nocasematch"

# Patterns that match no files expand to a null string
shopt -s "nullglob"

# Disable errors for patterns that fail to find a match
# during pathname expansion
shopt -u "failglob"

components=(

	"\[\e[0;38;5;15m\]"
	"("
	"\[\e[0m\]"

	"\[\e[1;38;5;11m\]"
	"\u"
	"\[\e[0m\]"

	"\[\e[0;38;5;15m\]"
	")"
	"\[\e[0m\]"

	"\[\e[1;38;5;15m\]"
	" @ "
	"\[\e[0m\]"

	"\[\e[0;38;5;15m\]"
	"("
	"\[\e[0m\]"

	"\[\e[1;38;5;14m\]"
	"\h"
	"\[\e[0m\]"

	"\[\e[0;38;5;15m\]"
	")"
	"\[\e[0m\]"

	"\[\e[1;38;5;12m\]"
	" \w"
	"\[\e[0m\]"
)

PS1=""
PS2=""
for part in "${components[@]}"; do
	PS1+="${part}"
	PS2+="${part}"
done

PS1+=" \[\e[1;38;5;13m\]\$\[\e[0m\] "
PS2+=" \[\e[1;38;5;13m\]-\[\e[0m\] "

# # Configure the prompt string
# if [[ $UID -eq 0 ]]; then
# 	# Set the root prompt string: '#'
# 	PS1+=" # "
# else
# 	# Set the user prompt string: '>'
# 	PS1+=" $ "
# fi
# PS1+="\[\e[0m\]"
# PS2+="\[\e[0m\]"
# export PS1
# export PS2


# if [[ ! -z $(type -p brew) ]]; then
# 	prefix="$(brew --prefix)"
# 	if [[ -d "${prefix}/etc/bash_completion.d" ]]; then
# 		for file in ${prefix}/etc/bash_completion.d/*; do
# 			# Source the bash completions
# 			source ${file}
# 		done
# 	fi
# 	if [[ -r "${prefix}/profile.d/bash_completion.sh" ]]; then
# 		source ${prefix}/profile.d/bash_completion.sh 2> /dev/null
# 	fi
# 	if [[ -e "${prefix}/bin/aws_completer" ]]; then
# 		complete -C "${prefix}/bin/aws_completer" aws
# 	fi
# 	unset prefix
# fi

# Remove the pesky bash sessions directory macOS creates
# in /etc/bashrc_Apple_Terminal since there's no *better* way
# to keep this file from being seen on my computer
[[ -d ~/.bash_sessions ]] && rm -rf ~/.bash_sessions

# Remove the shell_session_update() trap set in /etc/bashrc_Apple_Terminal
# to prevent it from trying to access the nonexistent ~/.bash_sessions
trap - EXIT

if [[ -f ~/.fzf.bash ]]; then
	source ~/.fzf.bash
fi

[[ -r ~/.cargo/env ]] && source ~/.cargo/env

# export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"

[[ -e "/usr/local/opt/oracle/lib/python3.9/site-packages/oci_cli/bin/oci_autocomplete.sh" ]] && source "/usr/local/opt/oracle/lib/python3.9/site-packages/oci_cli/bin/oci_autocomplete.sh"
