#!/usr/bin/env zsh

# Listen for shutdown signal
trap set_volume_to_0 SIGTERM

function set_volume_to_0 {
    osascript -e "set Volume 0"
}

while true
do
  # listen ...
done
