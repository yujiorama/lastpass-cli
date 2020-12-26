#!/bin/sh

set -eu

while getopts 'h' opts
do
  case "$opts" in
    h) /usr/bin/lpass --help; exit 0;;
    *) ;;
  esac
done

/usr/bin/lpass login --color=never --trust --plaintext-key --force "${USERNAME}"
/usr/bin/lpass "$@"
