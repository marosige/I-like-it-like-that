#!/usr/bin/env bash
cd $IGNITION_MAC/installers
source ../print.sh

###############################################################################
# Directory Structure
###############################################################################

task="Creating Directory Structure"
task $task

mkdir ~/bin                     # For installed scripts
mkdir ~/roms                    # For video game roms
mkdir ~/tmp                     # For temporarly files, clear this directory upon start up
mkdir ~/workspace               # For my git repos
mkdir ~/workspace/accedo        # For my work projects
mkdir ~/workspace/personal      # For my personal projects
mkdir ~/workspace/playground    # For temporarly projects
mkdir ~/workspace/third         # For 3rd party projects, libs sources

done $task
