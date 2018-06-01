#!/usr/bin/env zsh

# Try defaults command
# Print "Setting vram SystemAudioVolume to zero\n"
# sudo nvram SystemAudioVolume=" "

# This variable only needs to be set when running this script from outside of the project directory
local +r ProjectRoot=$PROJECT_ROOT

local +r DaemonPlistPath=$HOME/Library/LaunchAgents/com.rsmithio.disable_startup_sound.plist
print "Configuring plist file with current user's home directory and writing to LaunchAgents directory: $DaemonPlistPath\n"
/usr/bin/sed s/username/$(/usr/bin/id -un)/ $ProjectRoot/com.rsmithio.disable_startup_sound.plist > $DaemonPlistPath || exit 1

local +r DaemonScriptDir=$HOME/.disable_startup_sound
local +r DaemonScriptPath=$DaemonScriptDir/disable_startup_sound.zsh

print "Copying daemon script into home directory to make it easy to reference from plist file: $DaemonScriptPath\n"
mkdir $DaemonScriptDir || exit 1
cp $ProjectRoot/disable_startup_sound.zsh $DaemonScriptDir || exit 1
cp $ProjectRoot/set_volume_to_0.zsh $DaemonScriptDir || exit 1

local +r AlertScriptPath=$DaemonScriptDir/alert.applescript
print "Copying alert script to: $AlertScriptPath\n"
cp $ProjectRoot/alert.applescript $AlertScriptPath || exit 1

print "Loading launch daemon: com.rsmithio.disable_startup_sound\n"
launchctl load $DaemonPlistPath || exit 1

print "Starting launch daemon: com.rsmithio.disable_startup_sound\n"
launchctl start com.rsmithio.disable_startup_sound || exit 1

print "Done! Restart and the startup sound should be gone."

touch $DaemonScriptDir/disable_startup_sound.log
