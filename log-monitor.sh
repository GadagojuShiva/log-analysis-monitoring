#!/bin/bash

# Function to handle Ctrl+C
function ctrl_c() {
    echo -e "\nMonitoring interrupted. Exiting."
    exit 0
}

# Trap Ctrl+C and call the function
trap ctrl_c SIGINT

# Check for correct usage
if [ $# -lt 2 ]; then
    echo "Usage: $0 <log_file> <keyword1> <keyword2> ..."
    exit 1
fi

log_file=$1
keywords=("${@:2}")

# Function to monitor log file
function monitor_log() {
    tail -n0 -F "$1"
}

# Function to count occurrences of keywords
function count_keywords() {
    grep -o -E "$(IFS="|"; echo "${keywords[*]}")" | sort | uniq -c
}

# Main function
function main() {
    monitor_log "$log_file" | while read -r line; do
        echo "$line"
        echo "$line" >> log_monitor.log
    done
}

# Start monitoring
main

# Upon interruption, print keyword counts
echo "Monitoring interrupted."
echo "Keyword counts:"
count_keywords < log_monitor.log
