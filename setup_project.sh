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

