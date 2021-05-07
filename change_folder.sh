#!/bin/bash

dir=$(pwd)/
echo "$@"
for arg in $@ ; do
    new_dir=$(ls -p $dir | grep '/' | grep -ie "^$arg" -m 1)
    echo $new_dir
    if [[ ! -z "$new_dir" ]] ; then
        dir=$dir$new_dir
    fi
done
cd $dir
ls
