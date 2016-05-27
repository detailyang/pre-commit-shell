#!/bin/bash

echo $@

for file in "$@"; do
    echo $file
    shellcheck $file
done

echo "shell check done"
