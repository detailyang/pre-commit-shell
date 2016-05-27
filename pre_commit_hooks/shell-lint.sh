#!/bin/bash

files="${@:2}"
for file in $files; do
    echo $files
done

echo "shell check done"
