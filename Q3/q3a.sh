#!/bin/bash
options=$(ls -d */)
for i in $options; do 
    # Remove the trailing slash
    dir_name=${i%/}
    echo "$dir_name"
done