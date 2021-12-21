#                   __ _ _
#  _ __  _ __ ___  / _(_) | ___
# | '_ \| '__/ _ \| |_| | |/ _ \
# | |_) | | | (_) |  _| | |  __/
# | .__/|_|  \___/|_| |_|_|\___|
# |_|
# ==============================

# Don't source ~/.bashrc if running `sh`
[[ $0 == 'sh' ]] && return 0

# Source ~/.bashrc if it exists
[[ -r ~/.bashrc ]] && . ~/.bashrc
[[ -r ~/.cargo/env ]] && . ~/.cargo/env

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
[[ -d ~/.rvm/bin ]] && export PATH="$PATH:$HOME/.rvm/bin"

 # Load RVM into a shell session *as a function*
[[ -s ~/.rvm/scripts/rvm ]] && source ~/.rvm/scripts/rvm

[[ -r /etc/paths ]] && readarray -t a < /etc/paths

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
