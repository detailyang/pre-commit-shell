#! /bin/bash

# should trigger -- SC2115
rm -rf "$abcd/"

# should trigger -- SC2086
[ $0 == $1 ]

# should trigger -- SC1068
var = 42 
