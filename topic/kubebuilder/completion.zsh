#!/usr/bin/env zsh

exists kubebuilder && {
  zinit ice as"completion" lucid wait"2" atinit"zpcompinit" mv"completion -> _kubebuilder"
  zinit snippet https://github.com/rage28/.dot/blob/master/topic/kubebuilder/completion
}
