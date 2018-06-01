#!/usr/bin/env zsh

trap set_volume_to_0 SIGTERM SIGINT

local +r DaemonScriptDir=$HOME/.disable_startup_sound

function set_volume_to_0 {
    $DaemonScriptDir/set_volume_to_0.zsh

    if [[ $DEBUG_MODE ]]
    then
        $HOME/.disable_startup_sound/alert.applescript
    fi

    exit 0
}

sleep 10000000000000000
