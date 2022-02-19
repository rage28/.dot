#!/usr/bin/env zsh

zinit ice lucid wait'[[ "${NVM_LOAD}" = true ]]' load'[[ "${NVM_LOAD}" = true ]]' unload'[[ ! -v NVM_LOAD ]]'
zinit light "lukechilds/zsh-nvm"