# Log Monitor Script

This script continuously monitors a log file for new entries, counts occurrences of "ERROR" and "WARNING", appends them to an error log file, and generates summary reports.

## Usage

1. Clone this repository or download the `log_monitor.sh` script.
2. Make sure you have permission to execute the script:

    ```bash
    chmod +x log_monitor.sh
    ```

3. Run the script, providing the path to the log file as an argument:

    ```bash
    ./log_monitor.sh /var/log/auth.log
    ```

   Replace `/var/log/auth.log` with the path to your log file.

## Testing

To test the script:

1. Ensure that your log file contains some "ERROR" and "WARNING" entries.
2. Run the script as mentioned in the usage section.
3. Monitor the script output for new log entries, error counts, and warning counts.
4. Verify that the script generates summary reports after every 10 lines.


