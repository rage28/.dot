#!/usr/bin/env zsh

# vcap parsing
alias -g JCAP="| awk '/System-Provided/,/VCAP_APPLICATION/' | tail -n +2 | tail -r | tail -n +3 | tail -r | jq '.VCAP_SERVICES' | jq"