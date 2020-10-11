#!/usr/bin/env zsh

exists tmux && {
  # CONFIGURATION VARIABLES
  # Automatically start tmux
  : ${ZSH_TMUX_AUTOSTART:=false}
  # Only autostart once. If set to false, tmux will attempt to
  # autostart every time your zsh configs are reloaded.
  : ${ZSH_TMUX_AUTOSTART_ONCE:=true}
  # Automatically connect to a previous session if it exists
  : ${ZSH_TMUX_AUTOCONNECT:=true}
  # Automatically close the terminal when tmux exits
  : ${ZSH_TMUX_AUTOQUIT:=$ZSH_TMUX_AUTOSTART}

  # Wrapper function for tmux.
  function _zsh_tmux_plugin_run()
  {
    if [[ -n "$@" ]]; then
      command tmux "$@"
      return $?
    fi

    if [[ "$ZSH_TMUX_AUTOCONNECT" == "true" ]]; then
      tmux ls && read -r tmux_session && tmux attach -t "${tmux_session:-default}" || tmux new -s "${tmux_session:-default}"
      [[ "$ZSH_TMUX_AUTOQUIT" == "true" ]] && exit
    # Just run tmux
    else
      tmux new -s "${tmux_session:-default}"
      [[ "$ZSH_TMUX_AUTOQUIT" == "true" ]] && exit
    fi
  }

  # Autostart if not already in tmux and enabled.
  if [[ ! -n "$TMUX" && "$ZSH_TMUX_AUTOSTART" == "true" ]]; then
    # Actually don't autostart if we already did and multiple autostarts are disabled.
    if [[ "$ZSH_TMUX_AUTOSTART_ONCE" == "false" || "$ZSH_TMUX_AUTOSTARTED" != "true" ]]; then
      export ZSH_TMUX_AUTOSTARTED=true
      _zsh_tmux_plugin_run
    fi
  fi
}