#!/usr/bin/env zsh

# Configure plist file with current user's home directory and output into user LaunchAgents directory
/usr/bin/sed s/username/$(/usr/bin/id -un)/ com.rsmithio.disable_startup_sound.plist > $HOME/Library/LaunchAgents/com.rsmithio.disable_startup_sound.plist

# Copy daemon script into home directory to make it easy to reference from plist file
cp disable_startup_sound.zsh $HOME/.disable_startup_sound.zsh
