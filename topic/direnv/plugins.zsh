#!/usr/bin/env zsh

zplugin ice as"program" make"!" atclone"./direnv hook zsh > zhook.zsh" atpull"%atclone" src"zhook.zsh"
zplugin light "direnv/direnv"