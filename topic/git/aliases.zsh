#!/usr/bin/env zsh

# omz git aliases
zplugin snippet "OMZ::plugins/git/git.plugin.zsh"

# own
alias glg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)%Creset %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative --all"
alias gci="git commit -v --interactive"
alias gcf="git config"
alias gcfl="git config --list"
alias gbld="git branch -vv | command grep \": gone]\" | awk '{print \$1}' | xargs git branch -D"
