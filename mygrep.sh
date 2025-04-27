#!/bin/bash

# Show usage
usage() {
    echo "Usage: $0 [options] <search_string> <file>"
    echo "Options:"
    echo "  -n        Show line numbers"
    echo "  -v        Invert match"
    echo "  --help    Show this help"
    exit 1
}

# Check --help
if [[ "$1" == "--help" ]]; then
    usage
fi

# Parse options
show_line_numbers=false
invert_match=false

while [[ "$1" == -* ]]; do
    case "$1" in
        *n*)
            show_line_numbers=true
            ;;
        *v*)
            invert_match=true
            ;;
        *)
            usage
            ;;
    esac
    shift
done

# Check arguments
if [[ $# -lt 2 ]]; then
    echo "Error: Missing search string or file."
    usage
fi

search="$1"
file="$2"

if [[ ! -f "$file" ]]; then
    echo "Error: File not found."
    exit 1
fi

# Build grep command
cmd="grep -i"

if $invert_match; then
    cmd+=" -v"
fi

if $show_line_numbers; then
    cmd+=" -n"
fi

$cmd "$search" "$file"
