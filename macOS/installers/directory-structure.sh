#!/usr/bin/env bash

###############################################################################
# Directory Structure
###############################################################################

info () {
  printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

info "Creating Directory Structure"

mkdir ~/bin                     # For installed scripts
mkdir ~/bin/ignition            # For this sript :)
mkdir ~/roms                    # For video game roms
mkdir ~/tmp                     # For temporarly files, clear this directory upon start up
mkdir ~/workspace               # For my git repos
mkdir ~/workspace/accedo        # For my work projects
mkdir ~/workspace/personal      # For my personal projects
mkdir ~/workspace/playground    # For temporarly projects
mkdir ~/workspace/third         # For 3rd party projects, libs sources
