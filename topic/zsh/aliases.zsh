#!/usr/bin/env zsh

__reload_dotfiles() {
  # shellcheck disable=SC1090 disable=2039
  source "$HOME/.zshrc"
}

alias reload!='__reload_dotfiles'

# Port process holder function
_portuser() {
  lsof -n -i4TCP:$1 G LISTEN
}

alias portuser=_portuser

# run a function in sudo
__sudo_function() {
  sudo zsh -c "$functions[$1]" "$@"
}

alias fudo='__sudo_function'

# read profile dump
function _sort_profile_timings() {
  typeset -a lines
  typeset -i prev_time=0
  typeset prev_command

  while read line; do
      if [[ $line =~ '^.*\+([0-9]{10})\.([0-9]{6})[0-9]* (.+)' ]]; then
          integer this_time=$match[1]$match[2]

          if [[ $prev_time -gt 0 ]]; then
              time_difference=$(( $this_time - $prev_time ))
              lines+="$time_difference $prev_command"
          fi

          prev_time=$this_time

          local this_command=$match[3]
          if [[ ${#this_command} -le 80 ]]; then
              prev_command=$this_command
          else
              prev_command="${this_command:0:77}..."
          fi
      fi
  done < ${1:-/dev/stdin}

  print -l ${(@On)lines}
}

alias sortprof=_sort_profile_timings

# Advanced Aliases

# listing
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

alias zshrc='$EDITOR ~/.zshrc' # Quick access to the ~/.zshrc file

# file ops
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# grep
alias -g G='| grep --color=always -B 3 -A 3 -E'
alias -g GS='| grep --color=always -E'

# tail
alias t='tail -f'
alias -g T='| tail'

# heads or tails
alias -g HD='| head'
alias -g LS='| less'
alias -g LL="2>&1 | less"
alias -g MO="| most"

# /dev/null
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"

# find
alias fd='find . -type d -name'
alias ff='find . -type f -name'

# usage
alias dud='du -d 1 -h'
alias duf='du -sh *'

# misc
alias old='history'
alias help='man'
alias p='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'
alias whereami=display_info

# highlighter
if ! highlighter_loc="$(type h)" || (( ${+highlighter_loc} )); then
  alias -g H='| h'
fi
unset highlighter_loc

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'

# reload
zle -N reload!
