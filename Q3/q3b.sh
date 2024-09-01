#!/bin/bash

options=$(ls -t -d */)
for i in $options; do 
    # Remove the trailing slash
    dir_name=${i%/}
    
    # Get the size of the directory
    dir_size=$(du -sh "$dir_name" | awk '{print $1}')
    
    # Print the directory name along with its size
    echo "$dir_name $dir_size"
done 