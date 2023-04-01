#!/usr/bin/env zsh

exists fzf && {
    zinit snippet "https://github.com/junegunn/fzf/blob/master/shell/completion.zsh"
    zinit snippet "https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh"
}