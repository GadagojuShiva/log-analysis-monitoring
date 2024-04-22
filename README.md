# Log Analysis and Monitoring Shell Script

## Table of Contents

- [Log Analysis and Monitoring Shell Script](#log-analysis-and-monitoring-shell-script)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Script Overview](#script-overview)
  - [Function Definitions](#function-definitions)
  - [Script Execution Flow](#script-execution-flow)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Examples](#examples)
  - [Troubleshooting](#troubleshooting)

## Introduction

This shell script is designed to monitor a log file and optionally analyze it for specified keywords. It provides a simple yet effective way to monitor logs in real-time and generate summary reports based on specified criteria.

## Script Overview

- Accepts a log file path and optional keywords as command-line arguments.
- Monitors the log file for changes and appends new entries to a summary report.
- Optionally analyzes the log file for occurrences of specified keywords and generates a summary report.

## Function Definitions
### usage()
- Displays usage information for the script, including command-line arguments and examples.

### monitor_log()
- Monitors the log file for changes and appends new entries to a summary report. If keywords are provided, it filters the log entries based on those keywords.

### analyze_log()
- Analyzes the log file for occurrences of specified keywords and generates a summary report detailing the count of each keyword.

main()
The main function of the script, responsible for initiating the log monitoring process.

## Script Execution Flow

1. Check if the correct number of arguments are provided.
2. Check if the log file exists.
3. Start monitoring the log file.
4. Trap Ctrl+C to stop monitoring and perform log analysis.
5. Display messages indicating the monitoring process.

## Installation
No specific installation steps are required. Simply download the script and ensure it has executable permissions.

## Usage

To use the script, follow these steps:

1. Save the `log-monitor.sh` script to your desired directory.
   
2. Make the script executable by running `chmod +x log-monitor.sh`.
   
3. Run the script from the command line with the following syntax:
   
   ```bash
    Usage: ./log_monitor.sh <log_file_path> [<keyword1> [<keyword2>]]
    Example: ./log_monitor.sh /var/log/syslog 'ERROR' 'WARNING'
    If no keywords are provided, the entire log file will be monitored.
   ```
## Examples

Here are some examples of how to use the script:

1. Monitor the entire log file:
   ```bash
   ./log_monitor.sh /var/log/syslog
   ```
**Keyword Explanation**: In log files, "error" typically refers to a significant problem or failure, while "warning" indicates a potential issue or abnormal condition that may require attention but does not necessarily result in failure.
   
2. Monitor the log file for specific keywords: Apache access log for HTTP status codes:
   ```bash
   ./log-monitor.sh /var/log/apache2/access.log 404 500
   ./log_monitor.sh /var/log/syslog 'ERROR' 'WARNING'
   ```

## Troubleshooting
1. If the script fails to execute, ensure that the log file path is correct and the script has executable permissions.
2. Check for any errors or warnings displayed during script execution.
3. If the script stops unexpectedly, use Ctrl+C to stop monitoring and analyze the log manually.
