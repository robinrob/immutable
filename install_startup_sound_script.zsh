#!/usr/bin/env zsh

# Copy daemon script into home directory to make it easy to reference from plist file
cp disable_startup_sound.zsh $HOME/.disable_startup_sound.zsh

# Copy daeomon plist file into user LaunchAgents directory
cp com.rsmithio.disable_startup_sound.plist $HOME/Library/LaunchAgents/
