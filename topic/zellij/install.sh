#!/usr/bin/env bash

# exists zellij || {
#   fail "zellij not installed. Please visit https://zellij.dev/documentation/installation.html"
# }

# declare ZELLIJ_CONF_SOURCE="${DOTFILES_SRC}/topic/zellij/config"
# declare ZELLIJ_CONF_TARGET="${HOME}/.config/zellij"

# exists zellij && {
#   if [ -d "${ZELLIJ_CONF_TARGET}" ]; then
#     success "zellij is already configured"
#   else
#     notice "zellij is getting configured..."

#     link "${ZELLIJ_CONF_SOURCE}" "${ZELLIJ_CONF_TARGET}"

#     overwrite_prev_line
#     success "zellij successfully configured" "yes"
#   fi
# }