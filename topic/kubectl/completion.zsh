#!/usr/bin/env zsh

exists kubectl && {
  zplugin ice as"completion" lucid wait"1" atinit"zpcompinit" mv"completion -> _kubectl"
  zplugin snippet https://github.com/rage28/.dot/blob/master/topic/kubectl/completion
}
