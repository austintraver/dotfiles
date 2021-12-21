import sys
import os
import readline

from atexit import register
from pathlib import Path


# Don't continue adding runtime configurations if we're
# running Python version 2 or earlier (v2 was deprecated in 2020)
if sys.version_info[0] <= 2:
    sys.exit()

# Set the name of the history file
# Configure the python history filepath
xdg_data_home = Path(os.getenv('XDG_DATA_HOME', default='~/.local/share')).expanduser()
history_file = xdg_data_home.joinpath('./python/history')
history_file.parent.mkdir(parents=True, exist_ok=True)

# Set the length of the history file
readline.set_history_length(256)

# Enable tab completion
readline.parse_and_bind('tab: complete')

# Read the previous history, if there is any
if history_file.exists():
    readline.read_history_file(history_file)

# Register our intent to write our history when the interactive shell exits
register(readline.write_history_file, history_file)

xdg_cache_home = Path(os.getenv('XDG_CACHE_HOME', default='~/.cache')).expanduser()

# If we're running Python version 3.8 or later...
if sys.version_info[0] >= 3 and sys.version_info[1] >= 8:
    # Create a system-wide python cache directory
    # in order to prevent random directories named 
    # "./__pycache__/" from appearing all over the file system
    sys.pycache_prefix = xdg_cache_home.joinpath('./python')
    sys.pycache_prefix.mkdir(parents=True, exist_ok=True)

# import ajt

print('\x1b[4A\x1b[J')
# print('\E[J')
