Automated Project Bootstrapping & Process Management
Overview

This project automates the setup of a Student Attendance Tracker environment using a Shell Script. The script creates the required directory structure, copies application files into the correct locations, allows attendance threshold configuration, validates the environment, and handles user interrupts gracefully.

Project Structure

After execution, the script creates the following structure:

attendance_tracker_<project_name>/

├── attendance_checker.py

├── image.png

├── Helpers/

│ ├── assets.csv

│ └── config.json

└── reports/

└── reports.log

Requirements

Ubuntu/Linux environment
Bash shell
Python3 installed

How to Run

Make the script executable:

chmod +x setup_project.sh

Run the script:

./setup_project.sh

Enter a project name when prompted.
Choose whether to update attendance thresholds.
Features
Directory Creation
Creates a project directory named attendance_tracker_<project_name>.
Creates the required subdirectories:
Helpers
reports
File Deployment

Copies the following files into the correct locations:

attendance_checker.py
assets.csv
config.json
reports.log
image.png
Dynamic Configuration

Allows users to update:

Warning threshold
Failure threshold

The values are updated directly in config.json using sed.

Environment Validation

The script:

Checks if Python3 is installed.
Validates that all required files and directories exist.
Interrupt Handling

If the user presses Ctrl+C during execution:

The script creates an archive of the project directory.
The incomplete project directory is removed.
The script exits safely.
Testing

To verify the setup:

Run the script.
Confirm that the project directory is created.
Verify that all files exist in their correct locations.
Confirm that threshold updates are reflected in config.json.
Press Ctrl+C during execution to test archive creation and cleanup.
