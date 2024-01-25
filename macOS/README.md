# Gergő's macOS daily driver setup

The **ignition** script is designed to set up a wiped macOS environment to my preferred system configuration. It automates the installation of applications, dotfiles, and the configuration of system preferences.

## Usage

**Warning:** If you want to give these installs, preferences and dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need!  
Don’t blindly use my settings unless you know what that entails. Use at your own risk!

    bash -c "$(curl -fsSL https://raw.githubusercontent.com/marosige/I-like-it-like-that/main/macOS/bootstrap.sh)"

Feel free to customize the script and adapt it to your preferences. Enjoy a streamlined setup process for your macOS environment!

## Usage

**Warning:** Before applying these installs, preferences, and dotfiles, it is strongly recommended to fork this repository, carefully review the code, and remove elements you don't want or need. Utilize the script with caution and at your own risk!

To initiate the setup process, run the following command in your terminal:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/marosige/I-like-it-like-that/main/macOS/bootstrap.sh)"
```
Feel free to customize the script to suit your preferences. Enjoy a streamlined setup process for your macOS environment!

#### Acknowledgments

- https://macos-defaults.com/ - For many preferences scripts
- https://github.com/joeyhoer/starter - For the dotfiles installer script
- https://github.com/mathiasbynens/dotfiles - For something
- https://github.com/andrew8088/dotfiles - For something

<!--
## About my setup

### Bash Version and shebang

As of now, the Bash version distributed by Apple is limited to `3.2.57(1)-release` due to licensing concerns. To overcome this limitation, the **ignition** script installs the latest Bash version (`5.2.26(1)-release` at the time of writing) via Homebrew. The shebang line `#!/usr/bin/env bash` is employed to automatically select Bash 5.2 when available. The bash update occurs mid-script, ensuring that the script seamlessly transitions to and utilizes Bash 5.2, providing enhanced features and compatibility.

#!/bin/sh -> 3.2
#!/bin/bash -> 3.2
#!/opt/homebrew/bin/bash -> 5.2
#!/usr/bin/env bash -> 5.2 \\ 3/2
-->
