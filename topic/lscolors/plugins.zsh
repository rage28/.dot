#!/usr/bin/env zsh

zinit ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh"
zinit light "trapd00r/LS_COLORS"