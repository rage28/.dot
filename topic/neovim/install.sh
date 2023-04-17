#!/usr/bin/env bash

exists nvim || {
  fail "neovim not installed. Please visit https://github.com/neovim/neovim/wiki/Installing-Neovim"
}

declare NVIM_CONF_TARGET="${HOME}/.config/nvim"
declare NVIM_USER_CONF_SOURCE="${DOTFILES_SRC}/topic/neovim/config"
declare NVIM_USER_CONF_TARGET="${NVIM_CONF_TARGET}/lua/user"

exists nvim && {
  if [ -d "${NVIM_CONF_TARGET}" ]; then
    success "neovim is already configured"
  else
    notice "neovim is getting configured..."

    clone https://github.com/AstroNvim/AstroNvim ${NVIM_CONF_TARGET} 1
    link "${NVIM_USER_CONF_SOURCE}" "${NVIM_USER_CONF_TARGET}"
    
    overwrite_prev_line
    success "neovim successfully configured" "yes"
  fi
}
