#!/usr/bin/env bash

# Usage: ./filter_words.sh input.txt output.txt

input="$1"
output="$2"

if [[ -z "$input" || -z "$output" ]]; then
  echo "Usage: $0 input.txt output.txt"
  exit 1
fi

# Extract words, filter length >= 8, sort uniquely
tr -cs '[:alnum:]' '\n' < "$input" \
  | awk 'length($0) >= 8' \
  | sort -u > "$output"
