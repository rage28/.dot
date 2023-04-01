#!/usr/bin/env bash

exists fzf || {
  fail "fzf not installed. Please visit https://github.com/junegunn/fzf#installation"
}