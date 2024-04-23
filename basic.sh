#!/bin/bash

# Function to handle cleanup
cleanup() {
    echo "Exiting..."
    exit 0
}

# Trap Ctrl+C to gracefully stop script
trap cleanup SIGINT

# Define log file and error log file
LOG_FILE="/var/log/auth.log"
ERROR_LOG="error.log"

# Function to monitor log file and append ERROR and warning entries to error log
monitor_log() {
    tail -n 0 -f "$LOG_FILE" | egrep "ERROR|warning" >> "$ERROR_LOG"
}

# Main function
main() {
    echo "Starting log monitoring..."

    # Call the monitor_log function
    monitor_log
}

# Execute the main function
main
