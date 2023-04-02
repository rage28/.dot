#!/usr/bin/env zsh

exists zoxide && {
    zinit ice as"completion" lucid wait"1" atinit"zpcompinit" mv"completion -> _z"
    zinit snippet https://github.com/rage28/.dot/blob/feature/zoxide/topic/zoxide/completion

    eval "$(zoxide init zsh)"
}