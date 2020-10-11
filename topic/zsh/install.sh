#!/usr/bin/env bash

exists zsh && {
  ZPLUGIN_SOURCE="${TOPICS}/zsh/zplugin"
  ZPLUGIN_TARGET="${HOME}/.zplugin"

  if [ -d "$ZPLUGIN_TARGET/bin" ]; then
    notice "Already installed zplugin. Updating..."
    
    pushd . &>/dev/null
    cd "${ZPLUGIN_TARGET}/bin"
    rebase
    popd &>/dev/null

    success "Updated zplugin" "yes"
  else
    info "Installing zplugin..."
    if [ ! -d "${ZPLUGIN_SOURCE}"/.git ]; then
      clone https://github.com/zdharma/zinit.git "${ZPLUGIN_SOURCE}"
    fi

    overwrite_prev_line
    mkdir -p "${ZPLUGIN_TARGET}"
    link "${ZPLUGIN_SOURCE}" "${ZPLUGIN_TARGET}/bin" false
    success "Installed zplugin"
  fi
}