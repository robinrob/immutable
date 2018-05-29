#!/usr/bin/env zsh

# Link daemon script into home directory to make it easy to reference from plist file
ln -s $ZDOT_HOME/disable_startup_sound.zsh $HOME/.disable_startup_sound.zsh

# Link daeomon plist file into user LaunchAgents directory
ln -s $DOTFILES_BASE_HOME/config/files/com.rsmithio.disable_startup_sound.plist $HOME/Library/LaunchAgents
