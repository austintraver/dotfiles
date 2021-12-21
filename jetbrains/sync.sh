#!/bin/zsh

# ====================== #
#  ___ _   _ _ __   ___  #
# / __| | | | '_ \ / __| #
# \__ \ |_| | | | | (__  #
# |___/\__, |_| |_|\___| #
#      |___/             #
# ====================== #

# Establishes symlinks for the IntelliJ-based IDEs on the local file system.
# --------------------------------------------------------------------------

function sync() {
	typeset -l ide=${1}
    # Create symbolic links of the config directory 
    # within the directory pointing to the IDE's
	# application settings.
    for folder in ${0:a:h}/*(/); do
        rm -rf ${ide}/jba_config/${folder:t}
        ln -sv ${folder} ${ide}/jba_config/${folder:t}
    done
    rm -rf ${ide}/jba_config/mac.keymaps
    ln -sv ${0:a:h}/keymaps ${ide}/jba_config/mac.keymaps
}

# Link the settings in each IntelliJ-based IDE 
# to the settings stored within the config folder
for ide in ~/Library/Application\ Support/Jetbrains/*????.?(/); do 
	sync ${ide}
done

# Link the settings to the CodeWithMe environment
# to the settings stored within the config folder
for ide in ~/Library/Application\ Support/Jetbrains/CodeWithMeGuest*(/); do
	sync ${ide}
done
