#!/usr/bin/env zsh

# This variable only needs to be set when running this script from outside of the project directory
local +r ProjectRoot=$PROJECT_ROOT

local +r DaemonPlistPath=$HOME/Library/LaunchAgents/com.rsmithio.disable_startup_sound.plist
print "Configuring plist file with current user's home directory and writing to LaunchAgents directory: $DaemonPlistPath"
/usr/bin/sed s/username/$(/usr/bin/id -un)/ $ProjectRoot/com.rsmithio.disable_startup_sound.plist > $DaemonPlistPath

local +r DaemonScriptPath=$HOME/.disable_startup_sound.zsh
print "Copying daemon script into home directory to make it easy to reference from plist file: $DaemonScriptPath"
cp disable_startup_sound.zsh $DaemonScriptPath
