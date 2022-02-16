# ==============================================================================
#                                   _
#                           _______| |__  _ __ ___
#                          |_  / __| '_ \| '__/ __|
#                           / /\__ \ | | | | | (__
#                          /___|___/_| |_|_|  \___|
#
# ==============================================================================

# Profile the shell's startup-time
# setopt SOURCE_TRACE
# setopt XTRACE

# Tell the shell to load some useful zsh modules, but
# to hold off on doing so until they are actually used
# by the user during this interactive session.
zmodload -Fa 'zsh/stat'
zmodload -Fa 'zsh/files'
zmodload -Fa 'zsh/complete'
zmodload -Fa 'zsh/complist'

zmodload 'zsh/datetime'

# zmodload zsh/zprof

# Allow the use of hex color codes
zmodload zsh/nearcolor

# Export the values of the variables that configure
# the XDG base directory locations
export \
	XDG_DATA_HOME=${XDG_DATA_HOME:=~/.local/share} \
	XDG_STATE_HOME=${XDG_STATE_HOME:=~/.local/state} \
	XDG_CACHE_HOME=${XDG_CACHE_HOME:=~/.cache} \
	XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=~/.config} \

# Create the XDG base directories if they don't yet exist
() {
	local dir
	for dir in \
		${XDG_DATA_HOME} \
		${XDG_STATE_HOME} \
		${XDG_CACHE_HOME} \
		${XDG_CONFIG_HOME} \
	;
	do
		if [[ ! -d ${dir:P} ]]; then
			mkdir -v -p ${dir}
		fi
	done
}

if [[ ! -e "${XDG_CACHE_HOME}/zsh" ]]; then
	mkdir -v -p "${XDG_CACHE_HOME}/zsh"
fi

# These next two commands work to remove the
# ~/.zcompcache file from appearing
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${XDG_CACHE_HOME}/zsh/completion"
# This line, specifying recent-dirs-file works to remove the ~/.chpwd-recent-dirs file
zstyle ':chpwd:*' recent-dirs-file "${XDG_CACHE_HOME}/zsh/directories"
zstyle ':completion:*:*:*:*:*' menu selection
# Permit case-insensitive completion, but only in direction (upper -> lower)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' verbose yes
# https://learning.oreilly.com/library/view/learning-shell-scripting/9781783282937/ch05s02.html#ch05lvl2sec49
zstyle ':completion:*' squeeze-slashes true
# zstyle ':completion:*' recent-dirs-insert always
# zstyle ':chpwd:*' recent-dirs-default true
zstyle ':completion:*:default' menu select=1
# zstyle ':completion:history-words:*' list no
# zstyle ':completion:history-words:*' menu yes
# zstyle ':completion:history-words:*' remove-all-dups yes
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# prevent `cd` from selecting the parent directory (e.g.: cd ../<TAB>):
zstyle ':completion:*:cd:*' ignore-parents parent pwd

typeset -U path manpath infopath
typeset -Tx INFOPATH infopath ':'

if [[ ${OSTYPE} =~ 'darwin' ]]; then
	if [[ ${CPUTYPE} == 'x86_64' ]]; then
		HOMEBREW_PREFIX='/usr/local'
	elif [[ ${CPUTYPE} == 'arm64' ]]; then
		HOMEBREW_PREFIX='/opt/homebrew'
	fi
	HOMEBREW_CELLAR="${HOMEBREW_PREFIX}/Cellar"
	HOMEBREW_REPOSITORY="${HOMEBREW_PREFIX}"
	HOMEBREW_SHELLENV_PREFIX="${HOMEBREW_PREFIX}"


	path=(
		/usr/local/bin
		/usr/local/sbin
		/usr/bin
		/usr/sbin
		/bin
		/sbin
		${path}
	)

	manpath=(
		"${HOMEBREW_PREFIX}/share/man"
		${manpath}
	)

	infopath=(
		"${HOMEBREW_PREFIX}/share/info"
		${infopath}
	)

	# Include command completions provided by Homebrew packages
	fpath=(
		${HOMEBREW_PREFIX}/share/zsh/site-functions
		${fpath}
	)

	# Request that Homebrew be installed, and exit
	if [[ ! -e '/usr/local/bin/brew' ]] && [[ ! -e '/opt/homebrew/bin/brew' ]]; then
		print "Please install Homebrew: https://brew.sh" >&2
		return 1
	fi

	export \
		HOMEBREW_PREFIX \
		HOMEBREW_CELLAR \
		HOMEBREW_REPOSITORY \
		HOMEBREW_SHELLENV_PREFIX \
		HOMEBREW_NO_ENV_HINTS=1 \
		HOMEBREW_NO_COMPAT=1 \
		HOMEBREW_UPDATE_REPORT_ONLY_INSTALLED=1 \
		HOMEBREW_DISPLAY_INSTALL_TIMES=1 \
		HOMEBREW_NO_INSTALL_CLEANUP=1 \
		HOMEBREW_BUNDLE_NO_LOCK=1 \
		# HOMEBREW_NO_AUTO_UPDATE \

	local brew_cache_dir="${XDG_CACHE_HOME}/brew"
	if [[ ! -d ${brew_cache_dir:P} ]]; then
		mkdir -v -p "${XDG_CACHE_HOME}/brew"
	fi

	# Add Java Virtual Machine installations to PATH
	path=(/Library/Java/JavaVirtualMachines/*/Contents/Home/bin(N) ${path})


	local pkg=(python{,@3.{8..10}} 'man-db' )

	# Add homebrew binaries within the 'libexec' directory
	# to the PATH
	foreach pkg (
		'python@3.8'
		'python@3.9'
		'python@3.10'
		'python'
		'man-db'
	)
		if [[ -e ${HOMEBREW_PREFIX}/opt/${pkg} ]]; then
			path=(
				${HOMEBREW_PREFIX}/opt/${pkg}/libexec/bin(/N)
				${path}
			)
		fi
	end
	# Add homebrew binaries outside of any 'libexec' directory
	# to the PATH
	foreach pkg (
		'lsof'
		'curl'
		'rust'
		'ruby'
		'node@16'
		'node@14'
		'openssl@3'
	)
		if [[ -e ${HOMEBREW_PREFIX}/opt/${pkg} ]]; then
			path=(
				${HOMEBREW_PREFIX}/opt/${pkg}/bin(/N)
				${path}
			)
		fi
	end

	path=(
		~/.local/bin
		${XDG_CONFIG_HOME}/bin
		${HOMEBREW_PREFIX}/bin
		${HOMEBREW_PREFIX}/sbin
		${HOMEBREW_PREFIX}/opt/**/*/libexec/gnubin(N)
		${HOMEBREW_PREFIX}/lib/ruby/gems/3.0.0/bin(N)
		${path}
	)

	fpath=(
		${HOMEBREW_PREFIX}/opt/*/share/zsh/site-functions(/N)
		${fpath}
	)
fi


# ==============================================================================
#                     _     _     _
#                    | |__ (_)___| |_ ___  _ __ _   _
#                    | '_ \| / __| __/ _ \| '__| | | |
#                    | | | | \__ \ || (_) | |  | |_| |
#                    |_| |_|_|___/\__\___/|_|   \__, |
#                                               |___/
# ==============================================================================

# Set the location of history files for various programs
HISTFILE="${XDG_STATE_HOME}/zsh/history"
if [[ ! -e ${HISTFILE} ]]; then
	mkdir -v -p ${HISTFILE:h}
	touch ${HISTFILE}
fi
export HISTFILE

# Number of commands to store in internal history
let HISTSIZE=100000

# When the shell exits, save up this many commands to the history file
let SAVEHIST=100000

# Number of directories to remember having visited
let DIRSTACKSIZE=50

# Allow the `!` character to trigger command expansion
setopt BANG_HIST

# Execute history expansions immediately, without verification
setopt NO_HIST_VERIFY

# Remove function definitions from the history list.
setopt HIST_NO_FUNCTIONS

# Remove the history command from the history list when invoked via `fc -l`
setopt HIST_NO_STORE

# Share command history between active shell sessions
setopt SHARE_HISTORY

# Save command timestamps
setopt EXTENDED_HISTORY

# Trim unnecessary whitespace from commands in history
setopt HIST_REDUCE_BLANKS

# Don't save command if preceded by whitespace
setopt HIST_IGNORE_SPACE

# If the internal history needs to be trimmed to add the current command line,
# remove the oldest history event that has a duplicate.  You should be sure to
# set the value of HISTSIZE to a larger number than SAVEHIST in order to give
# you some room for the duplicated events, otherwise this option will behave
# just like HIST_IGNORE_ALL_DUPS once the history fills up with unique events.
setopt HIST_EXPIRE_DUPS_FIRST

# If a new command line being added to the history list duplicates an older one
# then the older command is not removed from the list
setopt NO_HIST_IGNORE_ALL_DUPS

# When searching for history entries in the line editor, do not display
# duplicates of a line previously found, regardless of whether or not
# the duplicates are contiguous.
setopt NO_HIST_FIND_NO_DUPS

# When writing out the history file, save older commands,
# including duplicates of commands already found in history
setopt NO_HIST_SAVE_NO_DUPS

# ==============================================================================
#                                 _   _
#                      ___  _ __ | |_(_) ___  _ __  ___
#                     / _ \| '_ \| __| |/ _ \| '_ \/ __|
#                    | (_) | |_) | |_| | (_) | | | \__ \
#                     \___/| .__/ \__|_|\___/|_| |_|___/
#                          |_|
#
# ==============================================================================

# In the line editor, the number of matches to list without asking first.  If
# the value is negative, the list will be shown if it spans at most as many
# lines as given by the absolute value.  If set to zero, the shell asks only if
# the top of the listing would scroll off the screen.
let LISTMAX=0

# Duration to wait for further input during a key-sequence
# (in hundredths of a second)
let KEYTIMEOUT=20

# `pushd` and `popd` will no longer print the directory name
setopt PUSHD_SILENT

# `pushd` with no arguments act like 'pushd $HOME'
setopt PUSHD_TO_HOME

# `cd` pushes the old directory onto the directory stack
setopt AUTO_PUSHD

# If enabled, `cd` is run if a valid command is not found
# setopt AUTO_CD

# If you set an `alias copy=cp`, then completion
# commands for the alias `copy` will not trigger
# the existing completions for `cd` unless
# NO_COMPLETE_ALIASES option is enabled
setopt NO_COMPLETE_ALIASES

# When  the current word has a glob pattern, do not
# insert all the words resulting from the expansion but
# generate matches as for completion and cycle through
# them like MENU_COMPLETE. The matches are generated as
# if a `*' was added to the end of the word,
setopt GLOB_COMPLETE

# Change the listing order so that adjacent items are
# ordered left-to-right > top-to-bottom, instead of being
# ordered top-to-bottom > left-to-right.
setopt LIST_ROWS_FIRST

# If arg is not a directory, see if it's a variable, and `cd` to its value
setopt CDABLE_VARS

# Immediately cycle through options for tab completion
setopt MENU_COMPLETE

# Output hex numbers in the familiar C syntax (e.g. '0x2f')
setopt C_BASES

# Output octal numbers in the familiar C syntax (e.g. '077')
setopt OCTAL_ZEROES

# Do arithmetic evaluation using C's operator precedence
setopt C_PRECEDENCES

# Clear right-side prompt upon submission of command
setopt TRANSIENT_RPROMPT

# Use a version of `echo` compatible with bash
setopt BSD_ECHO

# Enable prompt substitution
setopt PROMPT_SUBST

# When disowning a process, send a SIGCONT
setopt AUTO_CONTINUE

# Single letter commands call `fg`
setopt AUTO_RESUME

# Allow comments, even in an the interactive shell
setopt INTERACTIVE_COMMENTS

# List jobs in a verbose format
setopt LONG_LIST_JOBS

# Print a warning message when a global parameter is 
# created in a function by an assignment or in a math
# context.
setopt WARN_CREATE_GLOBAL

# If numeric filenames are matched by a filename generation
# pattern, sort the filenames numerically rather than
# lexicographically.
setopt NUMERIC_GLOB_SORT

# Send the HUP signal to running jobs when the shell exits.
setopt NO_HUP

# Report the status of background jobs immediately, rather than waiting until
# just before printing a prompt.
setopt NOTIFY

# Disable output flow control via start/stop characters.
setopt NO_FLOW_CONTROL

# Do not beep during listing completions
setopt NO_LIST_BEEP

# In fact, do not beep at all
setopt NO_BEEP

# Print the exit value of programs with non-zero exit status
setopt PRINT_EXIT_VALUE

# If TYPESET_SILENT is disabled, executing any of the ‘typeset’ family of
# commands with no options and a list of parameters that have no values to be
# assigned but already exist will display the value of the parameter.  If
# If TYPESET_SILENT is set, then it will only be shown when parameters are
# selected with the '−m' option.
# setopt TYPESET_SILENT
setopt NO_TYPESET_SILENT

# Do not automatically export global parameters to the environment
setopt NO_GLOBAL_EXPORT

# Do not automatically export all parameters to the environment
setopt NO_ALL_EXPORT

# ==============================================================================
#                          _                                      _
#           ___ _ ____   _(_)_ __ ___  _ __  _ __ ___   ___ _ __ | |_
#          / _ \ '_ \ \ / / | '__/ _ \| '_ \| '_ ` _ \ / _ \ '_ \| __|
#         |  __/ | | \ V /| | | | (_) | | | | | | | | |  __/ | | | |_
#          \___|_| |_|\_/ |_|_|  \___/|_| |_|_| |_| |_|\___|_| |_|\__|
#
# ==============================================================================

# Set vi as the default editor
export \
	VISUAL="nvim" \
	EDITOR="nvim" \
	PAGER="less" \
	EMAIL='austintraver@gmail.com' \

# If input redirection `<` is specified, but no command,
# assume that the user wants to open the file from `stdin` in the ${PAGER}
typeset \
	READNULLCMD='less' \
	NULLCMD='cat' \

# Set the language and locale category
# typeset -Hxg LANG LC_ALL
export \
	LANG='en_US.UTF-8' \
	LC_ALL='en_US.UTF-8' \

# Use standard US printer paper dimensions (8.5" x 11")
export PAPER='letter'

export TIME_STYLE='iso'

# Enable support for GPG encryption of echo command
export GPG_TTY=$(tty)

# Specify custom arguments to provide to the `less` command
export LESS='iwFMRKJ$j-5$~$b-1$'

# Have `groff` use SGR escape sequences to format terminal output on linux
export GROFF_SGR=1

# Set location of config files
export \
	SSH_CONFIG="${XDG_CONFIG_HOME}/ssh/config" \
	NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/node/npmrc" \
	MOST_INITFILE="${XDG_CONFIG_HOME}/mostrc" \
	JUPYTER_CONFIG_DIR="${XDG_CONFIG_HOME}/jupyter" \
	INPUTRC="${XDG_CONFIG_HOME}/inputrc" \
	IRBRC="${XDG_CONFIG_HOME}/ruby/irbrc" \
	MYVIMRC="${XDG_CONFIG_HOME}/vim/vimrc" \
	TOGGL_CONFIG="${XDG_CONFIG_HOME}/toggl/config" \
	PHPRC="${XDG_CONFIG_HOME}/php/php.ini" \
	BROWSERSLIST_CONFIG="~/.browserlistrc" \
	AZURE_CONFIG_DIR="${XDG_CONFIG_HOME}/azure" \
	TOGGL_CONFIG="${XDG_CONFIG_HOME}/togglrc" \
	ASCIINEMA_CONFIG_HOME="${XDG_CONFIG_HOME}/asciinema" \
	CHEAT_CONFIG_PATH="${XDG_CONFIG_HOME}/cheat/conf.yml" \
	RIPGREP_CONFIG_PATH="${XDG_CONFIG_HOME}/ripgrep.conf" \
	# GEMRC="${XDG_CONFIG_HOME}/ruby/gemrc" \
	# PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc.py" \


# Configure runtime path for ruby, python, and node
typeset -Tx RUBYLIB rubylib ':'
typeset -Tx PYTHONPATH pythonpath ':'
typeset -Tx NODE_PATH node_path ':'

typeset -U \
	rubylib \
	pythonpath \
	node_path \

# Configure colors for the `ls`, `zls`, and `tree` commands
typeset -Tx LS_COLORS ls_colors ':'
typeset -Tx ZLS_COLORS zls_colors ':'
typeset -Tx TREE_COLORS tree_colors ':'
typeset -Tx JQ_COLORS jq_colors ':'

ls_colors=(
	'rs=0'
	'di=01;34'
	'ln=01;36'
	'mh=00'
	'pi=40;33'
	'so=01;35'
	'do=01;35'
	'bd=40;33;01'
	'cd=40;33;01'
	'or=40;31;01'
	'mi=00'
	'su=37;41'
	'sg=30;43'
	'ca=30;41'
	'tw=30;42'
	'ow=34;42'
	'st=37;44'
	'ex=01;32'
	'*.'{tar,gz,tgz,7z,t7z,zip,bz,jar,rar}'=01;31'
	'*.'{{m,j}p{,e}g,gif,bmp,png,heic,svg,tif{,f}'=01;35'
	'*.'{mov,m4{a,b,v},mp{3,4},fl{,a}c,mkv,avi,aac,wav}'=01;35'
)

zls_colors=(
	${ls_colors}
)

tree_colors=(
	${ls_colors}
)

# https://stedolan.github.io/jq/manual/#Colors
jq_colors=(
	'1;30' # null
	'0;37' # false
	'0;37' # true
	'0;37' # numbers
	'0;32' # strings
	'1;37' # arrays
	'1;37' # objects
)

# Set up a (trivial) list for subdirectories which can be
# supplied to `cd` regardless of the present working directory
cdpath+=(
	./
	~/
	~/Developer(/N)
	~/Desktop(/N)
	~/Documents(/N)
)



export \
	PYTHONPYCACHEPREFIX="${XDG_CACHE_HOME}/python/pycache" \
	HUGO_CACHEDIR="${XDG_CACHE_HOME}/hugo" \
	MYSQL_HOME="${XDG_CONFIG_HOME}/sql" \
	LESSHISTFILE="${XDG_STATE_HOME}/less/history" \
	MYSQL_HISTFILE="${XDG_STATE_HOME}/mysql/history" \
	GDBHISTFILE="${XDG_STATE_HOME}/gdb/history" \
	SQLITE_HISTORY="${XDG_STATE_HOME}/sqlite/history" \
	NODE_REPL_HISTORY="${XDG_STATE_HOME}/node/history" \
	WGETRC="${XDG_CONFIG_HOME}/wgetrc" \
	GH_CONFIG_DIR="${XDG_CONFIG_HOME}/gh" \
	MAVEN_REPOSITORY="${HOME}/.maven" \

() {
	local dir
	for dir in \
		"${PYTHONPYCACHEPREFIX}" \
		"${HUGO_CACHEDIR}" \
		"${MYSQL_HOME}" \
		"${LESSHISTFILE:h}" \
		"${MYSQL_HISTFILE:h}" \
		"${GDBHISTFILE:h}" \
		"${SQLITE_HISTORY:h}" \
		"${NODE_REPL_HISTORY:h}" \
		"${XDG_DATA_HOME}/cheat" \
		"${XDG_DATA_HOME}/nvim" \
		"${XDG_DATA_HOME}/vim" \
		;
	do
		if [[ ! -d ${dir} ]]; then
			mkdir -v -p ${dir}
		fi
	done
}


# Create Dart's pub cache directory, if needed
if [[ $(whence dart) ]]; then
	export PUB_CACHE="${HOME}/.local/opt/pub"
	if [[ ! -d ${PUB_CACHE} ]]; then
		mkdir -v -p ${PUB_CACHE}
	fi
fi


# Configure settings for Wolfram Script
export \
	WOLFRAMSCRIPT_CONFIGURATIONPATH="${XDG_CONFIG_HOME}/wolfram/config.txt" \
	WOLFRAMSCRIPT_AUTHORIZATIONPATH="${XDG_CONFIG_HOME}/wolfram/auth.txt" \
	WOLFRAMSCRIPT_KERNELPATH=/Applications/Mathematica.app/Contents/MacOS/WolframKernel \

# Remove quotes from `jp` if output is a single string
export JP_UNQUOTED=1

# Colorize BSD `ls`
export \
	CLICOLOR=1 \
	LSCOLORS='ExGxFxdxCxDxDxHBhDhCgC' \


PROMPT2='> '

# REPORTTIME: commands whose combined user and system execution
#	times (measured in seconds) are greater than this value have
#	timing statistics printed for them.  Output is suppressed for
#	commands executed within the line editor, including completion;
#	commands explicitly marked with the time keyword still cause
#	the summary to be printed in this case.
let -x REPORTTIME=3


# Enable interpretation of SGR escape sequences
if [[ $(whence watch) ]]; then
	alias watch='watch -c'
fi

# Format timestamps in an RFC 3339 compliant format
# alias du='du --time-style=+"%F %T%:z"'
# alias date='date +"%F %T%:z"'

# A command that's more common on non-Unix platforms
alias dir='ls'

# Enable vi keybindings on info pages
alias info='info --vi-keys'

# Hide the banner message when opening ffmpeg
if [[ $(whence ffmpeg ffprobe) ]]; then
	alias ffmpeg='ffmpeg -hide_banner'
	alias ffprobe='ffprobe -hide_banner'
fi


# Have `mutt` refer to `neomutt` but only if it's installed
if [[ $(whence neomutt) ]]; then
	alias mutt='neomutt'
fi


typeset -U \
	path \
	fpath \
	cdpath \
	manpath \
	infopath \
	fignore \


# fpath(): An array of directories specifying the search path for
# function definitions.  This path is searched when a function with the -u
# attribute is referenced.  If an executable file is found, then it is read and
# executed in the current environment.
fpath=(
 	${XDG_CONFIG_HOME}/zsh/functions(/NF)
 	${XDG_DATA_HOME}/zsh/site-functions(/NF)
 	${fpath}
 	/usr/share/zsh/functions(/NF)
 	/usr/share/zsh/site-functions(/NF)
 	/usr/share/zsh/5.8/functions(/NF)
 	/usr/share/zsh/5.8/site-functions(/NF)
 	/usr/local/share/zsh/functions(/NF)
 	/usr/local/share/zsh/site-functions(/NF)
 	/usr/local/share/zsh/5.8/functions(/NF)
 	/usr/local/share/zsh/5.8/site-functions(/NF)
)

# fignore() An array containing the suffixes of files to be
# ignored during filename completion.  However, if completion only
# generates files with suffixes in this list, then these files are
# completed anyway.
fignore+=(
	.zip
	.tgz
	.gz
	.tar
	.img
	.iso
	.dmg
	.zip
	.o
	.pyc
	.class
)


# Prepare trigger to #autoload functions declared in ${fpath} directories
(){
	local folder subdir
	for folder in ${fpath}; do
		for subdir in ${folder}/*(/FN); do
			autoload -Uz ${subdir}
		done
	done
	if [[ -e ${XDG_CONFIG_HOME}/zsh/functions ]]; then
		autoload ${XDG_CONFIG_HOME}/zsh/functions/*
	fi
}

# Initialize module to provide compatibility for bash-based completion functions
autoload +X bashcompinit && bashcompinit

() {
	# Skip this function if we are the root user.
	if (( ${UID} == 0 )); then
		return
	fi

	# compinit flags are defined as follows
	# -d FILE: dump a cache of compiled completion scripts to FILE
	# -C: skip the security check entirely
	#    NOTE: will prevent changes from being made to the completions
	#    cached in the dump file
	# -u: silently include all insecure files and directories
	# -i: silently ignore all insecure files and directories
	autoload +X compinit
	compinit
	# compinit -d ~/.zcompdump
}

# Add autosuggestion features to the shell
# provided that the autosuggest module can be located
() {
	local script="${XDG_CONFIG_HOME}/zsh/autosuggest.sh"
	if [[ -r ${script} ]]; then
		source ${script}
	fi
}

# If `aws` is found, generate its command completion
[[ $(whence aws) ]] && () {
	complete -C 'aws_completer' 'aws'
}

# If `az` is found, generate its command completion
[[ $(whence az) ]] && () {
	source $(whence -p az)/../../etc/bash_completion.d/az
}

# If `yq` is found, generate a file which contains its command completion
[[ $(whence yq) ]] && () {
	local file="${XDG_CONFIG_HOME}/zsh/functions/_yq"
	if [[ ! -e ${file} ]]; then
		yq shell-completion --variation=zsh > ${file}
	fi
}

# ============================================================================
#             _              _     _           _ _
#            | | _____ _   _| |__ (_)_ __   __| (_)_ __   __ _ ___
#            | |/ / _ \ | | | '_ \| | '_ \ / _` | | '_ \ / _` / __|
#            |   <  __/ |_| | |_) | | | | | (_| | | | | | (_| \__ \
#            |_|\_\___|\__, |_.__/|_|_| |_|\__,_|_|_| |_|\__, |___/
#                      |___/                             |___/
# ============================================================================

bindkey -v

# Enable zsh surround
autoload +X surround
zle -N delete-surround surround
bindkey -a 'ds' delete-surround
zle -N add-surround surround
bindkey -a 'ys' add-surround
bindkey -M visual 'S' add-surround
zle -N change-surround surround
bindkey -a 'cs' change-surround

# Add a similar key to escape
# (Workaround for issue with key configuration in IntelliJ IDEA for Windows)
bindkey -v '^]' vi-cmd-mode

# Enable changing text vi-style within delimiters ' " `
autoload +X select-quoted
zle -N select-quoted
(){
	typeset char
	for char in {a,i}{\',\",\`}; do
		bindkey -M visual ${char} select-quoted
		bindkey -M viopp ${char} select-quoted
	done
}

# Enable changing text vi-style within brackets () [] {} <>
autoload +X select-bracketed
zle -N select-bracketed
(){
	typeset mode motion
	for mode in {visual,viopp}; do
		for motion in {a,i}{\(,\),\[,\],\{,\},\\,\<,\>,b,B}; do
			bindkey -M ${mode} ${motion} select-bracketed
		done
	done
}

# Edit the current command with <C-v><C-v>
autoload +X edit-command-line
zle -N edit-command-line
bindkey -v '^V^V' edit-command-line
bindkey -a '^V^V' edit-command-line

# Make 'cw' consistent with 'dw'
bindkey -a -s cw dwi

# Configure insert mode keybindings
bindkey -v '^A' vi-beginning-of-line
bindkey -v '^B' vi-backward-char
bindkey -v '^E' vi-end-of-line
bindkey -v '^F' vi-forward-char
# bindkey -v '^G' push-input
bindkey -v '^K' vi-kill-eol
bindkey -v '^N' vi-down-line-or-history
bindkey -v '^P' vi-up-line-or-history
bindkey -v '^R' history-incremental-pattern-search-backward
bindkey -v '^S' history-incremental-pattern-search-forward
bindkey -v '^T' transpose-chars
bindkey -v '^U' backward-kill-line
bindkey -v '^V' vi-quoted-insert
bindkey -v '^W' backward-kill-word
bindkey -v '^Y' vi-put-after
bindkey -v '^[.' vi-yank
bindkey -v '^[<' beginning-of-history
bindkey -v '^[>' end-of-history
bindkey -v '^[b' vi-backward-word
bindkey -v '^[c' capitalize-word
bindkey -v '^[d' kill-word
bindkey -v '^[f' vi-forward-word
bindkey -v '^[l' vi-down-case
bindkey -v '^[t' transpose-words
bindkey -v '^[u' vi-up-case
bindkey -v '^H' backward-delete-char
bindkey -a '^H' backward-delete-char
bindkey -v '^?' backward-delete-char
bindkey -a '^?' backward-delete-char
bindkey -a 'K' run-help

bindkey -v '^[[A' vi-up-line-or-history
bindkey -a '^[[A' vi-up-line-or-history
bindkey -M isearch '^[[A' history-incremental-pattern-search-backward
bindkey -M isearch '^P' history-incremental-pattern-search-backward

bindkey -v '^[[B' vi-down-line-or-history
bindkey -a '^[[B' vi-down-line-or-history
bindkey -M isearch '^[[B' history-incremental-pattern-search-forward
bindkey -M isearch '^N' history-incremental-pattern-search-forward

bindkey -v '^[[H' vi-beginning-of-line # Home
bindkey -a '^[[H' vi-beginning-of-line # Home

bindkey -a '^[OF' vi-end-of-line # End
bindkey -v '^[OF' vi-end-of-line # End

bindkey -a '^[[F' vi-end-of-line # End
bindkey -v '^[[F' vi-end-of-line # End

# Right Arrow Key
bindkey -v '^[[C' vi-forward-char
bindkey -a '^[[C' vi-forward-char
bindkey -v '^[OC' vi-forward-char
bindkey -a '^[OC' vi-forward-char

# Ctrl + Right Arrow Key
bindkey -v '^[[1;5C' vi-forward-word
bindkey -a '^[[1;5C' vi-forward-word
bindkey -v '^[O5C' vi-forward-word
bindkey -a '^[O5C' vi-forward-word

# Left Arrow Key
bindkey -v '^[[D' vi-backward-char
bindkey -a '^[[D' vi-backward-char
bindkey -v '^[OD' vi-backward-char
bindkey -a '^[OD' vi-backward-char

# Ctrl + Left Arrow Key
bindkey -v '^[[1;5D' vi-backward-word
bindkey -a '^[[1;5D' vi-backward-word
bindkey -v '^[O5D' vi-backward-word
bindkey -a '^[O5D' vi-backward-word

function insert-initial-arg() {
	zle insert-last-word -- -1 1
}
zle -N insert-initial-arg
bindkey -a '^[[5~' insert-initial-arg # PageUp
bindkey -v '^[[5~' insert-initial-arg # PageUp


function insert-final-arg() {
	zle insert-last-word -- -1 -1
}
zle -N insert-final-arg
bindkey -a '^[[6~' insert-final-arg # PageDown
bindkey -v '^[[6~' insert-final-arg # PageDown

# Also add the GNU readline keybinding for accepting the current search
bindkey -M isearch '^M' accept-search
bindkey -M isearch '^J' accept-search
# Enable the use of regular expressions during a history search
# w/ GNU readline style history search
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M isearch '^R' history-incremental-pattern-search-backward
bindkey -M isearch '^S' history-incremental-pattern-search-forward
# w/ vi style history search
bindkey -M isearch '^P' history-incremental-pattern-search-backward
bindkey -M isearch '^N' history-incremental-pattern-search-forward

autoload widget-clear-screen
zle -N widget-clear-screen
bindkey -v '^L' widget-clear-screen
bindkey -a '^L' widget-clear-screen

# =============================================================================

# function zle-line-pre-redraw() {
# 	# local user host symbol dir shell
# 	# user="%F{3}%n%f"
# 	# host="%F{6}%M%f"
# 	# symbol="%F{5}>%f"

# 	prompt="[%F{1}${HISTNO}%f] %U%F{4}%1~%f%u %F{7}%D{%F %T}%f %B%(!.#.->)%b "
# }
# zle -N zle-line-pre-redraw

# # Initialize the prompt
# prompt="[%F{1}${HISTCMD}%f] %U%F{4}%1~%f%u %F{7}%D{%F %T}%f %B%(!.#.->)%b "

# # Send a control code to the console, which changes the appearance of the cursor
# # to a vertical line.
# print -n $'\x1b[5 q'

prompt="|> "


function fuzzy-search-history() {
	# Assemble the list of commands found in history,
	# such that it only contains the most recent occurrence
	# of a particular command.
	typeset -a entries=()
	for line in ${(f)"$(fc -nl 1)"}; do
		entries+=${${line//\\n/ }//\\t/ };
	done
	BUFFER=$(
		print -l ${(Oau)entries} \
			| tr -cd '[:print:]\n' \
			| grep \
				-a \
				--invert-match \
				--regexp '[[:alnum:]]\{30\}' \
				--regexp '[^[:space:]]\{79\}' \
				--regexp '^[[:cntrl:]]*$' \
				--regexp '^[^[:alnum:]]' \
				--regexp '^[^[:space:]]*$' \
			| fzf \
				--bind 'backward-eof:abort' \
				--exact \
				--height='40%' \
				--min-height='5' \
				--no-sort \
				--no-multi \
				--reverse \
				--query=${LBUFFER}
	)
	CURSOR=${#BUFFER}
	zle reset-prompt
	zle vi-add-eol
}
zle -N fuzzy-search-history
# bindkey -v '^O' fuzzy-search-history
# bindkey -a '^O' fuzzy-search-history
bindkey -v '^R' fuzzy-search-history
bindkey -a '^R' fuzzy-search-history

function launch-editor() {
	command ${EDITOR}
}
zle	-N launch-editor
bindkey -v '^X' launch-editor
bindkey -a '^X' launch-editor

# Customize the prompt string based on the current vi mode
function zle-keymap-select() {
	zle reset-prompt
	# Don't change the cursor for the console inside Jetbrains
	# Jetbrains IDE has a bug, if cursor is set not to blink
	# then the cursor will freeze in the mid-blink "invisible" position
	if [[ -v IDE ]]; then
		# Set the cursor style to "blinking block"
		print -N '\E[1 q'
		return 0
	fi
	if [[ ${KEYMAP} == 'vicmd' ]]; then
		# For "normal mode"
		# Set the cursor style to "solid block"
		print -N '\E[2 q'
	elif [[ ${KEYMAP} =~ 'viins|main' ]]; then
		# For "insert mode"
		# Set the cursor style to "blinking bar"
		print -N '\E[5 q'
	fi
	if [[ $(whence autosuggest-fetch) ]]; then
		zle autosuggest-fetch
	fi
	return 0
}
zle -N zle-keymap-select

# Initialize the cursor to blinking block,
# if the cursor is not inside of the IDE
# NOTE: can't run this, doing so will prevent
# autosuggestions from appearing
# function zle-line-init() {
# 	zle -K viins
#   print -N '\E[5 q'
# 	print -n "\e] 2 ; ${PWD} \a"
# }
# zle -N zle-line-init
# Prepare trigger for `cdr` command
autoload -Uz add-zsh-hook chpwd_recent_dirs cdr

add-zsh-hook chpwd chpwd_recent_dirs
add-zsh-hook -Uz zsh_directory_name zsh_directory_name_cdr

#compdef toggl
if [[ "$(basename -- ${(%):-%x})" != "_toggl" ]] && [[ $(whence compdef) ]]; then
	function _toggl() {
		eval $(env COMMANDLINE="${words[1,$CURRENT]}" _TOGGL_COMPLETE=complete-zsh toggl)
	}
	autoload compdef
	compdef _toggl toggl
fi

# Look for the syntax highlighting module for `zsh`, and load it if we find it.
() {
	local highlight="${XDG_CONFIG_HOME}/zsh/highlight.sh"
	if [[ -e ${highlight} ]]; then
		source ${highlight}
	fi
}

autoload -Uz chpwd_recent_dirs cdr add-zsh-hook

# Add `adb`, the Android device debugger, if it is found on this system.
() {
	local android="${HOME}/Library/Android/sdk"
	if [[ ! -e ${android} ]]; then
		return
	fi
	path=(
		~/Library/Android/sdk/tools(N)
		~/Library/Android/sdk/tools/bin(N)
		~/Library/Android/sdk/cmdline-tools/latest/bin(N)
		~/Library/Android/sdk/platform-tools(N)
		${path}
	)
}


# If NeoVim is installed, use `vi` as an alias for `nvim`.
if [[ $(whence nvim) ]]; then
	# Open manpages using NeoVim's `:Man!` command
	export MANPAGER='nvim +Man!'
	# Have `vi` refer to `nvim`
	alias vi='nvim'
	autoload +X compdef
	compdef vi=nvim
	# Set the width of manpages to 80 columns
	# export MANWIDTH=80
	if (( ${COLUMNS} >= 80 )); then
		export MANWIDTH=80
	fi
else
	# Have `vi` refer to `vim`
	alias vi='vim'
fi

# Enable experimental support for Docker Buildkit
# https://github.com/moby/buildkit/blob/master/frontend/dockerfile/docs/experimental.md
# export DOCKER_BUILDKIT=1

() {
	# Refrain from taking further action if Go is not installed on this machine.
	if [[ ! $(whence go) ]]; then
		return
	fi
	# Determine the directory in which Go installs binary executables.
	local dir=$(go env GOBIN)
	if [[ -z ${dir} ]]; then
		dir=$(go env GOPATH)/bin
	fi
	# Add this directory to the path
	path=(
		${dir}
		${path}
	)

	# Use the Terminal to flash keyboard hex files faster
	# https://github.com/austintraver/wally
	# https://github.com/zsa/wally-cli
	if [[ $(whence wally) ]]; then
		function flask() {
			wally flash ${HOME}/Downloads/*.hex(om[1])
		}
	fi
}


# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# https://github.com/Aloxaf/fzf-tab/wiki/Configuration#group-colors
zstyle ':fzf-tab:*' switch-group ',' '.'
# preview directory's content with exa when completing cd
[[ $(whence exa) ]] && {
	zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
}
# set the default color of completion text (white)
zstyle ':fzf-tab:*' default-color $'\033[38;5;3m'
zstyle ':fzf-tab:*' prefix '·'
zstyle ':fzf-tab:*' single-group prefix header
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':fzf-tab:*' show-group full
zstyle ':fzf-tab:*' continuous-trigger '/'


[[ $(whence fd) ]] && {
	# Use fd (https://github.com/sharkdp/fd) instead of the default find
	# command for listing path candidates.
	# - The first argument to the function ($1) is the base path to start traversal
	# - See the source code (completion.{bash,zsh}) for the details.
	_fzf_compgen_path() {
		fd --hidden --follow --exclude ".git" . "$1"
	}

	# Use fd to generate the list for directory completion
	_fzf_compgen_dir() {
		fd --type d --hidden --follow --exclude ".git" . "$1"
	}
}

# source ~/.fzf.zsh

# Initialize the fuzzy finder utilities, if they are found
() {
	[[ -e ~/.local/opt/fzf ]] || {
		print "warning: 'fzf' not found" >&2
		return
	}
	[[ -e ~/.local/opt/fzf-tab ]] || {
		print "warning: 'fzf-tab' not found" >&2
		return
	}
	export -T FZF_DEFAULT_OPTS fzf_default_opts ' '
	# fzf_default_opts=(
	# 	--no-mouse
	# 	--border=sharp
	# 	--height=80%
	# 	--min-height=15
	# 	--margin=1
	# 	--layout=reverse
	# )
	# export FZF_DEFAULT_COMMAND="fd --type f"
	source ~/.local/opt/fzf/shell/completion.zsh
	source ~/.local/opt/fzf/shell/key-bindings.zsh
	path=(~/.local/opt/fzf/bin(N) ${path})
	source ~/.local/opt/fzf-tab/fzf-tab.zsh
}

# Load RVM into a shell session, doing so from within a function.
() {
	# Refrain from taking further action if `rvm` is not installed on this machine.
	if [[ ! $(whence rvm) ]]; then
		return
	fi
	local script="${HOME}/.rvm/scripts/rvm"
	if [[ -s ${script} ]]; then
		source ${script}
	fi
}

() {
	# If the GitHub CLI is installed, disable notifications.
	if [[ $(whence gh) ]]; then
		export GH_NO_UPDATE_NOTIFIER=1
	fi
}

# Set the CHROME_EXECUTABLE environment variable to the Chrome binary,
# which, if memory serves, is used by the `puppeteer` framework.
# Additionally, set the BROWSER environment variable to `firefox`
# but onl. if the `firefox` binary is found on this machine.
() {
	[[ "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" ]] && {
		export CHROME_EXECUTABLE="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
	}
	[[ "/Applications/Firefox.app/Contents/MacOS/firefox" ]] && {
		export BROWSER="firefox"
	}
}

# Add a utility command to print the octal permission code for a given file.
zmodload zsh/stat
octo() {
	if (( ${#} != 1 )); then
		print 'Usage: `octo FILE`' >&2
		return 1
	fi
	integer permissions=$(builtin stat -o +mode ${1})
	builtin printf '%o\n' $(( permissions & 0777 ))
}

[[ -e ~/.env ]] && source ~/.env

path=(~/Library/Python/*/bin(N) ${path})

if [[ -e ~/.local/opt/google-cloud-sdk ]]; then
	path=( ~/.local/opt/google-cloud-sdk/bin ${path})
	source ~/.local/opt/google-cloud-sdk/completion.zsh.inc
else
	print "warning: 'google-cloud-sdk' not found" >&2
fi

# if [[ -e /Applications/VMware\ Fusion.app ]]; then
# 	path+=(/Applications/VMware\ Fusion.app/Contents/Library{,/vkd/bin})
#
# 	alias -g 350.vmx="/Users/austin/.vm/CSCI\ 350.vmwarevm/CSCI\ 350.vmx"
# 	350vm() {
# 		print "not working :(" >&2
# 		return 1
# 		vmrun start 350.vmx nogui
# 		ssh 350 || ssh 350
# 	}
#
# 	alias -g 353.vmx="/Users/austin/.vm/CSCI\ 353.vmwarevm/CSCI\ 353.vmx"
# 	353vm() {
# 		print "not working :(" >&2
# 		return 1
# 		vmrun start 353.vmx nogui
# 		ssh 353 || ssh 353
# 	}
# fi
#
# if [[ -e /Applications/VirtualBox.app ]]; then
# 	cs551() {
# 		VBoxHeadless -s cs551-vm
# 		ssh cs551
# 	}
# fi

# zprof

scour () {
	local INITIAL_QUERY=""                                              
	local RG_PREFIX="rg -l --no-heading --color=always --smart-case "
	FZF_DEFAULT_COMMAND="$RG_PREFIX '$INITIAL_QUERY'" fzf \
		--bind "change:reload:$RG_PREFIX {q} || true" \
		--ansi \
		--disabled \
		--query "$INITIAL_QUERY" \
		--height=50% \
		--layout=reverse \
		--preview 'bat --style=numbers --color=always {}'
}

path=(~/sdk/go1.*/bin(N) ${path})

path=(~/.cargo/bin(N) ${path})
