#!/usr/bin/env zsh

# -----
# zsh
# -----

zinit light "zsh-users/zsh-completions"

zinit ice lucid wait"1" atload"_zsh_autosuggest_start"
zinit load "zsh-users/zsh-autosuggestions"

zinit ice lucid wait"5" atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay" lucid
zinit light "zdharma-continuum/fast-syntax-highlighting"

# -----
# async
# -----

zinit ice atload'async_init'
zinit light "mafredri/zsh-async"
