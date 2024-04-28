#!/bin/bash
read input_dir
read output_dir
justfiles=$(find "$input_dir" -maxdepth 1 -type f)
dirs=$(find "$input_dir" -maxdepth 1 -type d)
allfiles=$(find "$input_dir" -type f -name "*.txt")
for file in $allfiles; do
    filename=$(basename "$file")
    dest="$output_dir/$filename"
    if [ -f "$dest" ]; then
        k=1
        while [ -f "$dest" ]; do
            new="${filename%.*}_$k.${filename##*.}"
            dest="$output_dir/$new"
            ((k=$k + 1))
        done
    fi
    
    cp "$file" "$dest"
done