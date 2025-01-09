#!/bin/bash

# Enable error handling
set -e

# Check if GitHub CLI is installed
if ! command -v gh &> /dev/null; then
    echo "Error: GitHub CLI (gh) is not installed"
    exit 1
fi

# Check if delete.txt exists
if [ ! -f "delete.txt" ]; then
    echo "Error: delete.txt not found"
    exit 1
fi

echo "Enter your GitHub username: "
read uname

if [ -z "$uname" ]; then
    echo "Error: Username not provided"
    exit 1
fi

# Display repositories to be deleted
echo "The following repositories will be deleted:"
while IFS= read -r repo || [ -n "$repo" ]; do
    if [ ! -z "$repo" ]; then
        echo "- $uname/$repo"
    fi
done < "delete.txt"

# Confirmation prompt
echo "Do you want to proceed? (y/N): "
read confirm

if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
    echo "Operation cancelled"
    exit 0
fi

# Execute repository deletion
echo "Starting deletion process..."
while IFS= read -r repo || [ -n "$repo" ]; do
    if [ ! -z "$repo" ]; then
        reponame="$uname/$repo"
        echo "Deleting: $reponame"
        if gh repo delete "$reponame" --yes; then
            echo "✓ Successfully deleted $reponame"
        else
            echo "⚠ Failed to delete $reponame"
        fi
    fi
done < "delete.txt"

echo "Process completed"
