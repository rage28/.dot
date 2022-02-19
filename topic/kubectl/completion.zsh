#!/usr/bin/env zsh

exists kubectl && {
  zinit ice as"completion" lucid wait"1" atinit"zpcompinit" mv"completion -> _kubectl"
  zinit snippet https://github.com/rage28/.dot/blob/master/topic/kubectl/completion
}
