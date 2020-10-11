#!/usr/bin/env zsh

exists mvn && {
  mvn() {
    case "$1" in
      clean)
        ;&
      install)
        command time mvn -am --offline -DskipTests -Dmaven.test.skip=true "$@"
        ;;
      online)
        1=()
        command time mvn -am -DskipTests -Dmaven.test.skip=true "$@"
        ;;
      raw)
        1=()
        command time mvn "$@"
        ;;
    esac
  }

  mvnp() {
    case "$1" in
      clean)
        ;&
      install)
        command time mvn -T 1C -am --offline -DskipTests -Dmaven.test.skip=true "$@"
        ;;
      online)
        1=()
        command time mvn -T 1C -am -DskipTests -Dmaven.test.skip=true "$@"
        ;;
      raw)
        command time mvn -T 1C "$@"
        ;;
    esac
  }
}