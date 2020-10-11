#!/usr/bin/env zsh

zplugin ice lucid wait'[[ "${NVM_LOAD}" = true ]]' load'[[ "${NVM_LOAD}" = true ]]' unload'[[ ! -v NVM_LOAD ]]'
zplugin light "lukechilds/zsh-nvm"