#!/usr/bin/env zsh

local +r LogFilePath=$HOME/.disable_startup_sound/disable_startup_sound.log

function init_log_file {
    if ! [[ -f $HOME/.disable_startup_sound/disable_startup_sound.log ]]
    then
        touch $LogFilePath
    fi
}

function set_volume_to_0 {
    # init_log_file
    osascript -e "set Volume 0"
    print "Attempted system audio silence at: $(date '+%Y-%m-%d_%H:%M:%S')" >> $LogFilePath
}

set_volume_to_0
