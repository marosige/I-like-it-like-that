#!/bin/bash

###############################################################################
# Safari
###############################################################################

source ./print.sh

exit_value=0

# Show full website address in Safari
# On: true
# Off: False
#defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true #> /dev/null 2>&1


#errors=$(defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true 2>&1)
#[[ ! -z "$errors" ]] && close; message $errors; exit 1

sudo defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true &> ~/ignition.log
echo $?

#cmdout=$(sudo defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true 2>&1)
#[[ ((?)) ]] && { close; message 'fail' } || { close; message 'success' }
#[[ ((?)) ]] && { close; message $cmdout; exit 1; }
#es=$?
#[[ ((es)) ]] && close; message $cmdout; exit 1

#if ((es)); then
#  close; message $cmdout; exit 1
#fi

exit $exit_value
