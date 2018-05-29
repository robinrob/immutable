# Disable OS X Startup Sound
You can disable the OS X startup sound using the scripts in this project.

It uses a launch daemon ([launchd](http://www.launchd.info/) which runs on startup, and listens for the `SIGTERM` shutdown signal. When this signal is received, the daemon sets the system volume to 0. Therefore on the next startup your mac should not make the annoying startup sound/chime.

This solution therefore just automates the existing manual method of reducing your volume to zero before shutdown/restart. It also means that your volume will be set to 0 on each startup. You 
can fix this by simply adding a line to the top of `disable_startup_sound.zsh` like:

```
osascript -e "set Volume 5"
```

where possible values are from 0 to 10.

## Installation
- Open the file `com.rsmithio.disable_startup_sound.plist` and configure the following line, replacing `robin` with your username: `<string>/Users/robin/.disable_startup_sound.zsh</string>`
- Run `install_startup_sound_script.zsh` to copy the launch daemon plist and script files into the correct locations
- Log out then back in or restart. The daemon should now be running. You can check by running: `ps aux | grep disable_startup_sound`
- On next startup the startup sound should be gone!

## Debugging
You can manually attempt to launch the launchd daemon like so:
```
launchctl load ~/Library/LaunchAgents/com.rsmithio.disable_startup_sound.plist
```

Check the configuration was loaded:
```
launchctl list | grep disable_startup_sound
```

Then start the daemon:
```
launchctl start com.rsmithio.disable_startup_sound
```

Check it is running:
```
ps aux | grep disable_startup_sound
```

Stop the daemon:
```
launchctl stop com.rsmithio.disable_startup_sound
```

Unload the configuration:
```
launchctl remove com.rsmithio.disable_startup_sound
```