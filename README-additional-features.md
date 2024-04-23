# Log Monitoring Script with Rotation and multiple log files

This script monitors multiple log files for errors and warnings, appends them to separate error log files, generates summary reports, and performs log rotation to manage file size.

## Features

- Monitor multiple log files simultaneously.
- Track error and warning counts separately for each log file.
- Append error and warning entries to separate error log files.
- Perform log rotation to manage file size.
- Generate summary reports for each log file.

## Usage

1. Clone this repository or download the `log_monitor.sh` script.
2. Make sure you have permission to execute the script:

    ```bash
    chmod +x log-monitor-additional-features.sh
    ```

3. Run the script, providing the paths of log files as arguments:

    ```bash
    ./log-monitor-additional-features.sh /path/to/logfile1 /path/to/logfile2 /path/to/logfile3 ...
    ```

4. The script will start monitoring the specified log files and generate summary reports.

## Log Rotation

- Log rotation is performed when the error log file reaches a maximum size threshold of 5 MB.
- The script renames the error log file to `<log_file_name>.old` and creates a new empty error log file to continue logging errors and warnings.

## Configuration Options

- You can adjust the maximum size threshold for log rotation by modifying the `max_size_mb` variable in the script.

## Testing

To test the script:

1. Ensure that your log files contain some error and warning entries.
2. Run the script as mentioned in the usage section.
3. Verify that the script monitors the log files, tracks error and warning counts, performs log rotation, and generates summary report
