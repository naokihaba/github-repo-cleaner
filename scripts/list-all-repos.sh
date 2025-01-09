#!/bin/bash

# Set output filename
output_file="github_repos.txt"

echo "Fetching GitHub repository list"
echo "Enter your GitHub username:"
read username

if [ -z "$username" ]; then
    echo "Error: Username not provided"
    exit 1
fi

# Get repository names and save to file
gh repo list $username --limit 300 --json name -q '.[].name' > "$output_file"

echo "Repository names have been saved to ${output_file}"
