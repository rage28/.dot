#!/usr/bin/env zsh

exists kubectl && {
    zinit ice from"gh-r" as"program" \
        bpick"*amd64*" \
        mv"krew-* -> krew" \
        atclone"./krew install krew" \
        atpull"%atclone" \
        atload'export PATH="${HOME}/.krew/bin:${PATH}"'
    zinit light "kubernetes-sigs/krew"
}