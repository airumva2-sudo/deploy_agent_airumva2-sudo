#!/bin/bash

echo "Enter project name:"
read project_name
if [ -d "attendance_tracker_$project_name" ]; then
	echo "Directory already exists."
fi
mkdir "attendance_tracker_$project_name"
echo "Main folder created successfully!"
mkdir "attendance_tracker_$project_name/Helpers"
mkdir " attendance_tracker_$project_name/reports"
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

