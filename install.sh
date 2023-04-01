#!/usr/bin/env bash

main() {
  clear

  # ------
  # setopts
  # ------

  # freak-out on err
  set -e

  # enable extended globbing
  shopt -s extglob nullglob globstar

  # ------
  # vars
  # ------

  declare -r REQUIRED_SHELL=zsh
  declare -r OS=$(uname)

  declare -r DOTFILES="$HOME/.dotfiles"
  declare -r DOTFILES_SRC=$(pwd -P)
  declare -r LIBS="$DOTFILES_SRC/libs"
  declare -r TOPICS="$DOTFILES_SRC/topic"

  declare -A SUPPORTED_OS=([darwin]=1)

  # -----
  # libs
  # -----

  # shellcheck source=libs/ansi
  source "${LIBS}/ansi"
  # shellcheck source=libs/prompt
  source "${LIBS}/prompt"
  # shellcheck source=libs/utils
  source "${LIBS}/utils"
  # shellcheck source=libs/compat
  source "${LIBS}/compat"

  # -----
  # prerequisites
  # -----

  h1 "Checking Compatibility"
  compat::checks


  # -----
  # main
  # -----

  # execute all (in)stallers
  h1 "Configuring system"

  # -----
  # link
  # -----

  # link all the .symlink files to $HOME/
  h2 'Linking configs'
  find -H "$TOPICS" -maxdepth 2 -name '*.symlink' -not -path '*.git*' |
  while read -r src;
  do
    dst="$HOME/.$(basename "${src%.*}")"
    # info "Linking ${src} -> ${dst}"
    link "$src" "$dst"
  done

  # link dotfiles to $HOME
  link "$DOTFILES_SRC" "$DOTFILES"


  # -----
  # initial cacerts
  # -----

  h2 "Configuring cacerts"
  curl -L http://curl.haxx.se/ca/cacert.pem -o ~/.certs.pem


  # -----
  # install
  # -----

  h2 "Installing & configuring topics"
  find -H "$TOPICS" -maxdepth 2 -name 'install.sh' -not -path '*.git*' |
  while read -r installer;
  do
    # shellcheck disable=SC1090
    source "${installer}"
  done


  # -----
  # load zsh
  # -----

  h2 "Setting up ZSH"
  # If this user's login shell is not already "zsh", attempt to switch
  TEST_CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
  if [ "$TEST_CURRENT_SHELL" != "$REQUIRED_SHELL" ]; then
    info "Trying to set ZSH as your default shell"

    (exists chsh) || {
      notice "Error trying to set ZSH as the default shell. System does not have 'chsh'"
      fail "Please manually change your default shell to ZSH and run this script again"
    }

    chsh -s "$(grep /zsh$ "/etc/shells" | tail -1)"
  fi
  success "ZSH is now your default shell"

  # -----
  # clean
  # -----

  sleep 3; 
  clear

  # -----
  # start
  # -----

  h1 "Starting ZSH"
  env zsh -l
}

main