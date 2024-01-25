#!/usr/bin/env bash

source ./print.sh
#source /dev/stdin <<< "$(curl -s --insecure https://raw.githubusercontent.com/marosige/I-like-it-like-that/main/macOS/print.sh)"

message "Message"
title "Title"
warn "Warn"
question "Question"
task "Task"; printf "\n"
success "Success"
fail "Fail"
confirm "Confirm?"
