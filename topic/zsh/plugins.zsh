#!/usr/bin/env zsh

# -----
# zsh
# -----

zplugin light "zsh-users/zsh-completions"

zplugin ice lucid wait"1" atload"_zsh_autosuggest_start"
zplugin load "zsh-users/zsh-autosuggestions"

zplugin ice lucid wait"5" atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay" lucid
zplugin light "zdharma/fast-syntax-highlighting"

# -----
# async
# -----

zplugin ice atload'async_init'
zplugin light "mafredri/zsh-async"
