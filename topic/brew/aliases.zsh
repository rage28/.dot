#!/usr/bin/env zsh

exists brew && {
  brew() {
  case "$1" in
    cleanup)
      (cd "$(brew --repo)" && git prune && git gc)
      command brew cleanup
      rm -rf "$(brew --cache)"
      ;;
    bump)
      command brew update
      command brew upgrade
      brew cleanup
      ;;
    *)
      command brew "$@"
      ;;
  esac
  }
}
