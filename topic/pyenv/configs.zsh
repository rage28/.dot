#!/usr/bin/env zsh

exists pyenv && {
  eval "$(pyenv init -)"
}

exists pyenv-virtualenv-init && {
  eval "$(pyenv virtualenv-init -)"
}