# Log Analysis and Monitoring Shell Script

## Table of Contents

- [Log Analysis and Monitoring Shell Script](#log-analysis-and-monitoring-shell-script)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Script Overview](#script-overview)
  - [Function Definitions](#function-definitions)
    - [`ctrl_c()`](#ctrl_c)
    - [`monitor_log()`](#monitor_log)
    - [`count_keywords()`](#count_keywords)
  - [Main Function](#main-function)
    - [Script Execution Flow](#script-execution-flow)
    - [`main()`](#main)
  - [Usage](#usage)

## Introduction

This shell script automates the analysis and monitoring of log files using Bash shell scripting. It continuously monitors a specified log file for new entries, performs basic log analysis, and generates a summary report.

## Script Overview

The `log-monitor.sh` script performs the following tasks:

## Function Definitions

### `ctrl_c()`

This function handles the interruption signal (Ctrl+C) and gracefully exits the script. It's registered using the `trap` command to catch the SIGINT signal.

### `monitor_log()`

This function continuously monitors the specified log file (`$1`) for new entries using the `tail` command with the `-F` option, which follows the file as it grows.

- ``tail``: Prints the last part of files. Here, it's used with the -F option to follow the file as it grows, continuously displaying new lines appended to the file.

### `count_keywords()`

This function counts occurrences of keywords or patterns provided as arguments (`$2`, `$3`, ...) in the log entries using the `grep`, `sort`, and `uniq` commands. It extracts matching lines with `grep`, sorts them with `sort`, and counts unique occurrences with `uniq -c`.

- `grep`: Searches for patterns in each input file or standard input. It extracts lines containing the specified keywords.
- `sort`: Sorts lines of text files. Here, it's used to sort the extracted lines alphabetically.
- `uniq`: Reports or filters out repeated lines in a file. With the `-c` option, it also counts the number of occurrences of each line. Here, it counts unique occurrences of lines (keywords) extracted by `grep`.

## Main Function

### Script Execution Flow

1. Checks for correct usage and the presence of command-line arguments.
   
2. Sets variables for the log file path (`$log_file`) and keywords to monitor (`$keywords`).
   
3. Invokes the `main` function to start log monitoring and analysis.

### `main()`

This function executes the main functionality of the script:

- Starts log monitoring by piping the output of `monitor_log` to a `while` loop.
- Logs each new entry to the log file `log_monitor.log` and prints it to the console.
- Upon interruption (Ctrl+C), prints a message and calls `count_keywords` to generate a summary report.

## Usage

To use the script, follow these steps:

1. Save the `log-monitor.sh` script to your desired directory.
   
2. Make the script executable by running `chmod +x log-monitor.sh`.
   
3. Run the script from the command line with the following syntax:
   
   ```bash
   ./log-monitor.sh <log_file> <keyword1> <keyword2> ...
