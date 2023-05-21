#!/usr/bin/env zsh

exists zoxide && {
    zinit ice as"completion" lucid wait"1" atinit"zpcompinit" mv"completion -> _z"
    zinit snippet https://raw.githubusercontent.com/rage28/.dot/master/topic/zoxide/completion
}
