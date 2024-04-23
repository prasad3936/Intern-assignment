#!/bin/bash
##################
#Author:Prasad C Zungare 
#Date : 23/04/2024
#version : 1
#This Script automates the analysis and monitoring of log files
##########################

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

# Function to monitor log file and append ERROR and WARNING entries to error log
monitor_log() {
    error_count=0
    warning_count=0

    # Continuously monitor log file
    tail -n 0 -f "$LOG_FILE" | while read -r line; do
        echo "$line"  # Print each new log entry
        echo "#####################################"
        # Count occurrences of "ERROR" and "WARNING"
        if [[ "$line" == *ERROR* ]]; then
            ((error_count++))
        fi
        if [[ "$line" == *WARNING* ]]; then
            ((warning_count++))
        fi

        # Append "ERROR" and "WARNING" entries to error log
        if [[ "$line" == *ERROR* ]] || [[ "$line" == *WARNING* ]]; then
            echo "$line" >> "$ERROR_LOG"
        fi

        # Generate summary report after every 10 lines
        if (( error_count % 10 == 0 )) || (( warning_count % 10 == 0 )); then
            echo "Summary Report:"
            echo "Total ERROR count: $error_count"
            echo "Total WARNING count: $warning_count"
        fi
    done
}

# Main function
main() {
    echo "Starting log monitoring..."

    # Call the monitor_log function
    monitor_log
}

# Execute the main function
main
