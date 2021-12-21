#!/bin/zsh

# Exit as soon as an error is encountered
setopt ERR_EXIT

print "This script does not yet support GitHub Codespaces" >&2
exit 1

# -----------------------------------------------------------------------------
# TODO:
#  * Remove the component involving the installation of a GPG key
#  * Add support for GitHub Workspaces
#  * Rewrite the script to handle installation on both Linux and macOS
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# Attempt installation of fzf-tab
git clone --depth 1 git@github.com:junegunn/fzf-tab.git ~/.fzf-tab
# -----------------------------------------------------------------------------

# Function used to link dotfiles
update () {

	# Return an error if the file being linked to does not exist
	if [[ ! -e ${1:a} ]] {
		echo "update(): cannot make a symlink to target '${1:a}' -- file not found" >&2
		return 1
	}

	# Recursively construct the necessary directories
	if [[ ! -d ${2:a:h} ]] {
		mkdir -v -p ${2:a:h}
	}

	# No need for a new symlink if it's to the same target
	if [[ ${1:a} == ${2:P} ]] {
		return 0
	}

	# If the target location is a directory, make a backup of it
	if [[ -d ${2} && !(-h ${2}) ]] {
	  mv -vT ${2:a} ${2:a}\~
	}

	# Create the symbolic link
	ln -svinT ${1:a} ${2:a}
	return 0
}

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

zparseopts -D -a option 'u' '-uninstall'

case ${option[1]} in
	-u | --uninstall)
		# Move the dotfiles directory to the Desktop
		tar -h -C ${XDG_CONFIG_HOME:A:h} -c ${XDG_CONFIG_HOME:A:t} -f ~/dotfiles.tgz -z
		print "Your dotfiles have been archived at ~/dotfiles.tgz"
		# Remove broken symbolic links
		print "Removing broken symbolic links"
		for file in (~/*(-@DN) ~/*/*(-@DN)); {
			rm -i -v -- ${file}
		}
		exit 0
		;;
esac

git submodule update --init --recursive

# Get the email of the user, e.g. 'monalisa@github.com'
email=$(git config --global --get user.email) || {
	git -C ${XDG_CONFIG_HOME} remote | read -A remote
	url=$(git -C ${XDG_CONFIG_HOME} remote get-url ${remote[1]})
	email=${${url#*:}%/*}@users.noreply.github.com
}

# If the user is on macOS
if [[ ${OSTYPE} =~ '^darwin' ]] && (( ${UID} != 0 )); then
	# Make sure Homebrew is installed
	if [[ ! $(whence brew) ]]; then
		ruby -e $(curl -fsSL \
			https://raw.githubusercontent.com/Homebrew/install/master/install)
	fi

	# Install GNU versions of CLI programs to ensure cross-compatibility
	brew install \
		{core,bin,find,diff}utils \
		gnu-{sed,tar,time,which,getopt} \
		gnupg man-db grep less bash gawk git{,-lfs} \
		hub node yarn neovim open{ssl,ssh} \
		|| :
	# ^ ignore the return code of this command

	# Make a directory for iCloud
	if [[ -e ~/Library/Mobile\ Documents/com~apple~CloudDocs ]]; then
		update ~/Library/Mobile\ Documents/com~apple~CloudDocs ~/iCloud
	fi
fi

# Get the full name of the user, e.g. 'Mona Lisa'
name=$(git config --global --get user.name) || {
	if [[ ${OSTYPE} == 'linux-gnu' ]]; then
		name=${(C)${(s<:>)$(getent passwd $USERNAME)}[5]%%,*}
	elif [[ ${VENDOR} == 'apple' ]]; then
		name=${(Cf)$(dscl . read /Users/$USER RealName):1}
	fi
}

# Create the XDG specification directories
mkdir -v -p \
	${XDG_CONFIG_HOME} \
	${XDG_CACHE_HOME} \
	${XDG_DATA_HOME}

# Make the directories that history files are contained inside
mkdir -m 0700 -v -p \
	${XDG_STATE_HOME}/{zsh,bash,less,sql{,ite},node,python,ruby,mutt,gdb,tmux}

# Make the directory required for persistent vim undo
mkdir -m 0700 -v -p \
	${XDG_DATA_HOME}/{,n}vim/{netrw,undo,swap,backup}

if [[ $OSTYPE =~ '^darwin' ]] {
	sudo mkdir -v -p /usr/local/share/zsh/site-functions
	sudo chmod -R 755 /usr/local/share/zsh
	sudo chown -R root:staff /usr/local/share/zsh
}

# Ensure we have the right setup for the rest of this script
source ${XDG_CONFIG_HOME}/zsh{env,rc}

ln -svinT ${XDG_CONFIG_HOME}/vim ~/.vim
ln -svinT ${XDG_CONFIG_HOME}/aws ~/.aws
ln -svinT ${XDG_CONFIG_HOME}/vim/vimrc ~/.vimrc
ln -svinT ${XDG_CONFIG_HOME}/nvim/init.vim ~/.nvimrc
ln -svinT ${XDG_CONFIG_HOME}/ideavim/ideavimrc ~/.config/ideavim/ideavimrc
ln -svinT ${XDG_CONFIG_HOME}/bashrc ~/.bashrc
ln -svinT ${XDG_CONFIG_HOME}/profile ~/.profile
ln -svinT ${XDG_CONFIG_HOME}/inputrc ~/.inputrc
ln -svinT ${XDG_CONFIG_HOME}/zshrc ~/.zshrc
ln -svinT ${XDG_CONFIG_HOME}/zshenv ~/.zshenv
# ln -svinT ${XDG_CONFIG_HOME}/gpg/gpg.conf ~/.gpg/gpg.conf
# ln -svinT ${XDG_CONFIG_HOME}/gpg/gpgsm.conf ~/.gpg/gpgsm.conf
# ln -svinT ${XDG_CONFIG_HOME}/gpg/gpg-agent.conf ~/.gpg/gpg-agent.conf
ln -svinT ${XDG_CONFIG_HOME}/man/man.conf ~/.manpath
# ln -svinT ${XDG_CONFIG_HOME}/gpg/sshcontrol ~/.gpg/sshcontrol
# ln -svinT ${XDG_CONFIG_HOME}/git/config ~/.gitconfig
# ln -svinT ${XDG_CONFIG_HOME}/git/ignore ~/.gitignore
ln -svinT ${XDG_CONFIG_HOME}/gdb/gdbinit ~/.gdbinit
ln -svinT ${XDG_CONFIG_HOME}/curlrc ~/.curlrc
ln -svinT ${XDG_CONFIG_HOME}/wgetrc ~/.wgetrc
ln -svinT ${XDG_CONFIG_HOME}/mostrc ~/.mostrc
ln -svinT ${XDG_CONFIG_HOME}/node/yarnrc ~/.yarnrc
ln -svinT ${XDG_CONFIG_HOME}/node/eslintrc.yml ~/.eslintrc.yml
ln -svinT ${XDG_CONFIG_HOME}/tmux.conf ~/.tmux.conf
ln -svinT ${XDG_CONFIG_HOME}/python/pythonrc.py ~/.pythonrc.py
# ln -svinT ${XDG_CONFIG_HOME}/ssh/config ~/.ssh/config

setup_node() {

	npm config set init-author-name ${name}
	npm config set init-author-email ${email}

	if [[ $(yarn config get email) != ${email} ]] {
		yarn config set email ${email}
	}

	if [[ $(yarn config get username) != ${email%@*} ]] {
		yarn config set username ${email%@*}
	}
}


setup_gpg() {

	if [[ ! (-o interactive) ]] {
		print "Skipping setup_gpg() as no TTY currently allocated" >&0
		return 0
	}

	# Don't set up gpg if the command does not exist
	if (( ! ${+commands[gpg]} )) {
		print "Skipping setup_gpg() as gpg is not installed..." >&2
		return 1
	}

	# Generate a GPG key if none exists
	command gpg -K ${email} || {
		print "gpg: Generating GPG key..."
		command gpg --batch --quick-generate-key \
			--passphrase '' \
			"${name} <${email}>" \
			rsa4096 \
			cert \
			never
	}

	# Get the primary key id
	keyid=$(
	command gpg --no-options --with-colons -K ${email} \
		| awk -F ':' '$1 == "sec" { print $5; }' \
		| head -n 1
	)

	keyid="0x${keyid}"

	# Get the key's fingerprint
	fingerprint=$(
		command gpg --no-options --with-colons -K ${keyid} \
			| awk -F ':' '$1 == "fpr" {print $10;}' \
			| head -n 1
	)

	# Get the key's keygrip
	keygrip=$(
		command gpg --no-options --with-colons -K ${fingerprint} \
			| awk -F ':' '$1 == "grp" {print $10;}' \
			| head -n 1
	)

	# Add a sign key if one doesn't already exist
	command gpg -K --with-colons ${fingerprint} \
	| head -n 1 \
	| awk -F ':' '{ print $12 }' \
	| grep -q 'E' || {
			echo "gpg: Encryption subkey not found... adding one"
			command gpg --batch --passphrase '' --quick-add-key ${fingerprint} rsa4096 sign never
	}

	# Add an encrypt key if one doesn't already exist
	command gpg -K --with-colons ${fingerprint} \
	| head -n 1 \
	| awk -F ':' '{ print $12 }' \
	| grep -q 'E' || {
			echo "gpg: Encryption subkey not found... adding one"
			=gpg --batch --passphrase '' --quick-add-key ${fingerprint} rsa4096 encr never
	}

	# Add an auth key if one doesn't already exist
	command gpg -K --with-colons ${fingerprint} \
	| head -n 1 \
	| awk -F ':' '{ print $12 }' \
	| grep -q 'A' || {
			print "gpg: Authorization subkey not found... adding one"
			command gpg --batch --passphrase '' --quick-add-key ${fingerprint} rsa4096 auth never
	}

	# Update the dotfiles to store the master key's keygrip for `ssh`
	grep -q $keygrip ${XDG_CONFIG_HOME}/gpg/sshcontrol || {
		print "gpg: Setting the keygrip for sshcontrol to ${keygrip}"
		print ${keygrip} > ${XDG_CONFIG_HOME}/gpg/sshcontrol
	}

	signingkey=$(git config --global user.signingkey) || {
		print "gpg: Setting default commit signature key to ${keyid}..."
		git config --global user.signingkey ${keyid}
	}

	if [[ ${signingkey} != ${keyid} ]] {
		print "gpg: Setting default commit signature key to ${keyid}..."
		git config --global user.signingkey ${keyid}
	}

	# Set the default key in gpg.conf
	grep -q "[ ]*default-key.*$keyid.*" ${XDG_CONFIG_HOME}/gpg/gpg.conf || {
		print "gpg: Setting default encryption key to ${keyid}..."
		sed -E -i \
			-e "s/[ ]*default-key.*/default-key ${keyid}/" \
			-e "s/[ ]*hidden-encrypt-to.*/hidden-encrypt-to ${keyid}/" \
			${XDG_CONFIG_HOME}/gpg/gpg.conf
	}
}

# Install the python3 extension for nvim
brew install neovim
pip install pynvim

setup_node

# setup_gpg

setup_nvim
