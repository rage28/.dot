#!/usr/bin/env zsh

exists pyenv && {
  zinit ice as"completion" lucid wait"1" atinit"zpcompinit" mv"completion -> _pyenv"
  zinit snippet https://github.com/rage28/.dot/blob/master/topic/pyenv/completion
}
