#!/usr/bin/env bash

exists tmux || {
  fail "TMUX not installed"
}

exists tmux && {
  TPM_SOURCE="${TOPICS}/tmux/tpm"
  TPM_TARGET="$HOME/.tmux/plugins"

  if [ -d "${TPM_TARGET}/tpm" ]; then
    notice "Already installed tmux-plugin-manager. Updating..."
    
    pushd . &>/dev/null
    cd "${TPM_TARGET}/tpm"
    rebase
    popd &>/dev/null

    success "Updated tmux-plugin-manager" "yes"
  else
    info "Installing tmux-plugin-manager..."
    if [ ! -d "${TPM_SOURCE}"/.git ]; then
      clone https://github.com/tmux-plugins/tpm.git "${TPM_SOURCE}"
    fi

    overwrite_prev_line
    mkdir -p "${TPM_TARGET}"
    link "${TPM_SOURCE}" "${TPM_TARGET}" false
    success "Installed tmux-plugin-manager"
  fi
}