#!/bin/bash

# Function to display usage information
usage() {
    echo "Usage: $0 <log_file_path> [<keyword1> [<keyword2>]]"
    echo "Example: $0 /var/log/syslog 'ERROR' 'WARNING'"
    echo "If no keywords are provided, the entire log file will be monitored."
    exit 1
}

# Check if correct number of arguments are provided
if [ "$#" -lt 1 ]; then
    usage
fi

log_file="$1"          # Assign the first argument to log_file variable
keyword1="$2"          # Assign the second argument to keyword1 variable
keyword2="$3"          # Assign the third argument to keyword2 variable
summary_report="summary-report.log"  # Assign the name for the summary report file

# Check if log file exists
if [ ! -f "$log_file" ]; then
    echo "Error: Log file '$log_file' not found."
    exit 1
fi

# Function to monitor log file
monitor_log() {
    if [ -z "$keyword1" ]; then  # If keyword1 is not provided
        tail -f "$log_file" | tee -a "$summary_report"  # Monitor entire log file and append to summary report
    else
        tail -f "$log_file" | grep --line-buffered -E "$keyword1|$keyword2" | tee -a "$summary_report"  # Monitor log file for specified keywords and append to summary report
    fi
}

# Function to perform log analysis
analyze_log() {
    if [ -n "$keyword1" ]; then  # If keyword1 is provided
        echo "Performing log analysis..." >> "$summary_report"  # Write analysis start message to summary report
        echo "---------------------------" >> "$summary_report"  # Write separator to summary report
        grep -o -E "$keyword1|$keyword2" "$log_file" | sort | uniq -c | awk '{ printf "%-10s %s\n", $1, $2 }' >> "$summary_report"  # Analyze log file for specified keywords, count occurrences, and append to summary report
        echo "---------------------------" >> "$summary_report"  # Write separator to summary report
        echo >> "$summary_report"  # Add empty line to summary report
    fi
}

# Trap Ctrl+C to stop monitoring
trap 'echo "Monitoring stopped."; analyze_log; exit 0' SIGINT

# Main function
main() {
    echo "Monitoring log file '$log_file'..."
    monitor_log
}

# Start script
main
