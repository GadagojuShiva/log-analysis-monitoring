#!/bin/bash  

# Function to handle Ctrl+C and exit gracefully
function ctrl_c() {
    echo -e "\nMonitoring interrupted. Exiting."
    exit 0
}

# Trap Ctrl+C and call the function
trap ctrl_c SIGINT

# Function to display usage message
function display_usage() {
    echo "Usage: $0 <log_file> <keyword1> <keyword2> ..."  # Display usage instructions
}

# Check for correct usage
if [ "$#" -lt 2 ]; then
    display_usage  # Show usage message if incorrect number of arguments provided
    exit 1
fi

log_file="$1"
keywords=("${@:2}")

# Check if log file exists and is readable
if [ ! -r "$log_file" ]; then
    echo "Error: Log file '$log_file' not found or not readable."  # Error message for missing or unreadable log file
    exit 1
fi

# Function to monitor log file
function monitor_log() {
    tail -n0 -F "$1"  # Continuously monitor the log file for new entries
}

# Function to count occurrences of keywords
function count_keywords() {
    grep -o -E "$(IFS="|"; echo "${keywords[*]}")" | sort | uniq -c  # Count occurrences of specified keywords
}

# Main function
function main() {
    monitor_log "$log_file" | while read -r line; do
        echo "$line"  # Output each line to the console
        echo "$line" >> log_monitor.log  # Log each line to a separate log file
    done
}

# Start monitoring
main

# Upon interruption, print keyword counts
echo "Monitoring interrupted."
echo "Keyword counts:"
count_keywords < log_monitor.log  # Count occurrences of keywords in the log file
