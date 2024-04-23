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
  - [Demo Video](#demo)

## Introduction

This script is designed to monitor a specified log file in real-time and optionally search for specific keywords within it. If no keywords are provided, the script monitors the entire log file. It also generates a summary report that contains either all log entries or only those matching specified keywords, along with their respective counts.

## Script Overview

Here's a brief description of the script's functionality:

- It takes at least one argument: the path to the log file to be monitored.
- Optionally, it can take two additional arguments: keywords to search for within the log file.
- It checks if the log file exists and if the correct number of arguments are provided.
- It monitors the log file in real-time using `tail -f`.
- If keywords are provided, it filters log entries to display only those containing the specified keywords.
- It generates a summary report (summary-report.log) which includes either all log entries or only those containing the specified keywords.
- The script can be stopped by pressing `Ctrl+C`, and upon termination, it performs log analysis (counting occurrences of specified keywords) and adds the analysis to the summary report.

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

1. Save the `log-monitor.sh` script to your desired directory. or Clone this Repo using `git clone https://github.com/GadagojuShiva/log-analysis-monitoring`  and cd to the `log-analysis-monitoring` and follow the commands below
   
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

## Demo
<iframe src="https://drive.google.com/file/d/11fN4J4wZcNuYtv2SgVODq812-AMhNHcX/preview" width="640" height="480"></iframe>

