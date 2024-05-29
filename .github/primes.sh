#!/bin/bash

# Directory argument
while getopts "d:" opt; do
    case $opt in
        d) dir=$OPTARG ;;
        *) echo "Usage: $0 -d <directory>"
           exit 1 ;;
    esac
done

if [ -z "$dir" ]; then
    echo "Directory not specified. Usage: $0 -d <directory>"
    exit 1
fi

# File path
file_path="$dir/primes.txt"

# Check if file exists
if [ ! -f "$file_path" ]; then
    echo "File $file_path does not exist."
    exit 1
fi

# Print the contents of the file
cat "$file_path"
