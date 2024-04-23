#!/bin/bash

# Define the log file to monitor
LOG_FILE="path/to/logfile.log"

# Function to handle cleanup
cleanup() {
    echo "Exiting..."
    exit 0
}

# Trap Ctrl+C to gracefully stop monitoring
trap cleanup SIGINT

# Function to monitor the log file
monitor_log() {
    error_count=0
    warning_count=0

    tail -n 0 -f "$LOG_FILE" | while read -r line; do
        # Perform log analysis here (count occurrences, generate reports, etc.)
        echo "$line"  # Example: Print each new log entry

        # Increment error count if line contains "error"
        if [[ "$line" == *error* ]]; then
            ((error_count++))
        fi

        # Increment warning count if line contains "warning"
        if [[ "$line" == *warning* ]]; then
            ((warning_count++))
        fi

        # Print error and warning counts after each iteration
        echo "Error count: $error_count, Warning count: $warning_count"
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
