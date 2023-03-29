#!/usr/bin/env zsh

# -----
# zsh
# -----

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

# -----
# async
# -----

zinit ice pick"async.zsh" atload'async_init'
zinit light "mafredri/zsh-async"
