#!/usr/bin/env zsh

exists lnav && exists cf && exists jq && {
    cflnav() {
        cf logs $@ 2>&1 | jq -Rcr 'capture("(?<timestamp>([^\\s]+)) (?<source>([^\\s]+)) (?<direction>([^\\s]+)) (?<body>{.*})$")|(.body|fromjson)' | lnav
    }
}
