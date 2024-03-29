#!/usr/bin/env zsh

exists tmux && {
  exists direnv && {
    alias tmux='direnv exec / tmux'
  }

  alias ta='tmux attach -t'
  alias tad='tmux attach -d -t'
  alias ts='tmux new-session -s'
  alias tl='tmux list-sessions'
  alias tksv='tmux kill-server'
  alias tkss='tmux kill-session -t' 
}