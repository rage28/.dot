#!/usr/bin/env bash

exists zsh && {
  ZINIT_SOURCE="${TOPICS}/zsh/zinit"
  ZINIT_TARGET="${HOME}/.zinit"

  if [ -d "$ZINIT_TARGET/bin" ]; then
    notice "Already installed zinit. Updating..."
    
    pushd . &>/dev/null
    cd "${ZINIT_TARGET}/bin"
    rebase
    popd &>/dev/null

    success "Updated zinit"
  else
    info "Installing zinit..."
    if [ ! -d "${ZINIT_SOURCE}"/.git ]; then
      clone https://github.com/zdharma-continuum/zinit.git "${ZINIT_SOURCE}"
    fi

    overwrite_prev_line
    mkdir -p "${ZINIT_TARGET}"
    link "${ZINIT_SOURCE}" "${ZINIT_TARGET}/bin" false
    success "Installed zinit"
  fi
}