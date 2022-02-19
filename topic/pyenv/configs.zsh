#!/usr/bin/env zsh

exists pyenv && {
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"

  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
}

exists pyenv-virtualenv-init && {
  eval "$(pyenv virtualenv-init -)"
}