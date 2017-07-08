#!/usr/bin/env bash

if [[ $# -eq 0 ]]; then
  cygstart explorer $(cygpath -wla .)
fi

for location in "$@"
do
    cygstart explorer $(cygpath -wla ${location})
done