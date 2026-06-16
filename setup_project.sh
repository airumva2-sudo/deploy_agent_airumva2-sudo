#!/bin/bash

echo "Enter project name:"
read project_name
if [ -d "attendance_tracker_$project_name" ]; then
	echo "Directory already exists."
fi
mkdir "attendance_tracker_$project_name"
echo "Main folder created successfully!"
mkdir "attendance_tracker_$project_name/Helpers"
mkdir "attendance_tracker_$project_name/reports"
echo "Project structure created successfully"

cp attendance_checker.py "attendance_tracker_$project_name/"
cp assets.csv "attendance_tracker_$project_name/Helpers/"
cp config.json "attendance_tracker_$project_name/Helpers/"
cp repots.log "attendance_tracker_$project_name/repots/"

read -p "Do you want to update the attendance thresholds(Y/N)?" update_thresholds
if [[ "$update_thresholds"=~^ [Yy]$ ]]; then
        read -p "Enter warning percentage:" warning_marks
        read -p "Enter failure percentage:" fail_marks
        sed -i "s/\"warning\": *[0-9]*/\"warning\": $warning_marks/" "attendance_tracker_$project_name/Helpers/config.json"
        sed -i "s/\"failure\": *[0-9]*/\"failure\": $fail_marks/" "attendance_tracker_$project_name/Helpers/config.json"
        echo "Thresholds updated for warning ($warning_marks) and failure ($fail_marks)"
else
        echo "Now using the default thresholds: warning (75%) and failure (50%)"
fi

echo "Checking Python installation."
if python3 --version >/dev/null 2>&1; then
        echo "Python3 is installed"
        python3 --version
else        
	echo "Warning: Python3 is not installed"
fi
if [ -f "attendance_tracker_$project_name/attendance_checker.py" ] &&
   [ -f "attendance_tracker_$project_name/Helpers/assets.csv" ] &&
   [ -f "attendance_tracker_$project_name/Helpers/config.json" ] &&
   [ -f "attendance_tracker_$project_name/reports/reports.log" ]; then
echo "Directory structure validated"
else
        echo "Warning: Directory structure validation failed"
fi

cleanup() {
        echo "Interrupt detected. Creating archive."
        tar -czf "attendance_tracker_{$project_name}_archive.tar.gz" "attendance_tracker_$project_name"
        rm -rf "attendance_tracker_$project_name"
        echo "Archive created successfully.Now deleting the incomplete workspace"
        echo "Incomplete project directory removed."
        exit 1
}
trap cleanup SIGINT
echo "Project setup completed successfully."

