#!/usr/bin/env bash

username=kamil
while IFS= read -r src; do
    dest=$(echo $src | sed "s/\/home\/$username/./" | xargs dirname)
    rsync -av --exclude=".*" $src $dest
done < config_files.txt
