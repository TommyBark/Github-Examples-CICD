#!/bin/bash

# Function to check if a number is prime
is_prime() {
    local num=$1
    if [ "$num" -le 1 ]; then
        return 1
    fi
    for ((i = 2; i * i <= num; i++)); do
        if [ $((num % i)) -eq 0 ]; then
            return 1
        fi
    done
    return 0
}

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

# Create directory if it doesn't exist
mkdir -p "$dir"

# Generate 100 prime numbers
count=0
num=2
primes=()

while [ $count -lt 100 ]; do
    if is_prime $num; then
        primes+=($num)
        ((count++))
    fi
    ((num++))
done

# Save primes to a file
output_file="$dir/primes.txt"
printf "%s\n" "${primes[@]}" > "$output_file"

echo "100 prime numbers have been saved to $output_file"
