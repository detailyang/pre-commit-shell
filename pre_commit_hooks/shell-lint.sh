#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset

DEBUG=${DEBUG:=0}
[[ $DEBUG -eq 1 ]] && set -o xtrace

echo 'Begin shellcheck'

if ! which shellcheck &>/dev/null; then
  >&2 echo 'shellcheck command not found'
  exit 1
fi

shellcheck "$@"
