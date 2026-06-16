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
