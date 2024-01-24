# Final steps

Most of the installs and preferences can be set by scripts, but there are some final steps you have to done by hand.

## Additional application settings

### Auto start applications

Somehow Spotify and Messenger auto starts and I can't turn it off with a script because they are not listed under:
```
/Library/StartupItems/
/Library/LaunchDaemons/
/Library/LaunchAgents/
/System/Library/StartupItems/
/System/Library/LaunchDaemons/
/System/Library/LaunchAgents/
~/Library/LaunchAgents/
```
To turn them off manually follow these steps:

#### Spotify

* Open the Spotify app
* Open the settings with `⌘,`
* Scroll down to the `Startup and window behaviour` section
* Set `Open Spotify automatically after you log into the computer` to `No`

#### Facebook Messenger

* Open the Messenger app
* Open the settings with `⌘,`
* Stay at the `General` tab
* Set `Open the Messenger desktop app when you start your computer` to `off`
