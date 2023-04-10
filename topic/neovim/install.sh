#!/usr/bin/env bash

exists nvim || {
  fail "neovim not installed. Please visit https://github.com/neovim/neovim/wiki/Installing-Neovim"
}

declare NVIM_CONF_SOURCE="${DOTFILES_SRC}/topic/neovim/config"
declare NVIM_CONF_TARGET="${HOME}/.config/nvim"

exists nvim && {
  if [ -d "${NVIM_CONF_TARGET}" ]; then
    success "neovim is already configured"
  else
    notice "neovim is getting configured..."

    link "${NVIM_CONF_SOURCE}" "${NVIM_CONF_TARGET}"

    overwrite_prev_line
    success "neovim successfully configured" "yes"
  fi
}
