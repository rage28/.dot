#!/usr/bin/env zsh

exists virtualenvwrapper && {
  export VIRTUALENVWRAPPER_PYTHON=`which python3`
}