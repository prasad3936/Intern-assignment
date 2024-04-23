#!/bin/bash
#Author:Prasad C Zungare
#Version : 1
#Date : 24/04/2024
#This script is with additional features like Alert emails , multiple log files.
############

# Function to handle cleanup
cleanup() {
    echo "Exiting..."
    exit 0
}

# Trap Ctrl+C to gracefully stop script
trap cleanup SIGINT

# Function to rotate error log file
rotate_log() {
    local log_file="$1"
    local error_log="error_$log_file.log"
    local max_size_mb=5  # Maximum size of error log file in MB

    # Check if error log file exists and its size exceeds threshold
    if [ -f "$error_log" ] && [ $(du -m "$error_log" | awk '{print $1}') -gt "$max_size_mb" ]; then
        echo "Rotating $error_log..."
        mv "$error_log" "${error_log}.old"
        touch "$error_log"
        echo "Log file rotated."
    fi
}

# Function to monitor log file and append ERROR and WARNING entries to error log
monitor_log() {
    local log_file="$1"
    local error_log="error_$log_file.log"

    declare -A error_counts
    declare -A warning_counts

    # Initialize error and warning counts
    error_counts["$log_file"]=0
    warning_counts["$log_file"]=0

    # Continuously monitor log file
    tail -n 0 -f "$log_file" | while read -r line; do
        echo "$line"  # Print each new log entry

        # Check for ERROR and WARNING patterns
        if grep -q "ERROR" <<< "$line"; then
            ((error_counts["$log_file"]++))
        fi
        if grep -q "WARNING" <<< "$line"; then
            ((warning_counts["$log_file"]++))
        fi

        # Append "ERROR" and "WARNING" entries to error log
        if grep -q "ERROR\|WARNING" <<< "$line"; then
            echo "$line" >> "$error_log"
        fi

        # Generate summary report after every 10 lines
        if (( error_counts["$log_file"] % 10 == 0 )) || (( warning_counts["$log_file"] % 10 == 0 )); then
            echo "Summary Report for $log_file:"
            echo "Total ERROR count: ${error_counts["$log_file"]}"
            echo "Total WARNING count: ${warning_counts["$log_file"]}"
            echo "-----------------------------------"
        fi

        # Rotate error log file
        rotate_log "$log_file"
    done
}

# Main function
main() {
    echo "Starting log monitoring..."

    # Check if log files are provided as arguments
    if [ "$#" -eq 0 ]; then
        echo "No log files provided. Exiting..."
        exit 1
    fi

    # Monitor each log file
    for log_file in "$@"; do
        monitor_log "$log_file" &
    done

    # Wait for all background processes to finish
    wait
}

# Execute the main function with provided log files as arguments
main "$@"


