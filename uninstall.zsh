#!/usr/bin/env zsh

local +r DaemonPlistPath=$HOME/Library/LaunchAgents/com.rsmithio.disable_startup_sound.plist
local +r DaemonScriptDir=$HOME/.disable_startup_sound

print "Stopping daemon\n"
launchctl unload $DaemonPlistPath
launchctl stop com.rsmithio.disable_startup_sound
launchctl remove com.rsmithio.disable_startup_sound

print "Removing daemon plist file: DaemonPlistPath=$HOME/Library/LaunchAgents/com.rsmithio.disable_startup_sound.plist\n"
rm $DaemonPlistPath

print "Removing daemon script directory: $DaemonScriptDir"
rm -r $DaemonScriptDir
