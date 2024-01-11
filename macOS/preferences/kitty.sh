#!/usr/bin/env bash

###############################################################################
# Kitty
###############################################################################

function add_conf {
  if ! grep -wq "$1" ~/.config/kitty/kitty.conf; then
      echo "$1" | sudo tee -a ~/.config/kitty/kitty.conf
  fi
}

# Adjust line height to 1
add_conf "adjust_line_height 1"

## Install OneDark theme (https://github.com/GiuseppeCesarano/kitty-theme-OneDark)

# Download OneDark theme if missing.
if ! ls ~/.config/kitty/OneDark.conf; then
    wget https://raw.githubusercontent.com/GiuseppeCesarano/kitty-theme-OneDark/master/OneDark.conf -P ~/.config/kitty
fi

# Add OneDark.conf to kitty.conf if missing.
add_conf "include ./OneDark.conf"
