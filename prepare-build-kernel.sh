#!/bin/bash

# Function to display messages with a delay
display_message() {
    local message="$1"
    local delay="${2:-2}"  # Default delay is 2 seconds
    echo "$message"
    sleep "$delay"
}

# Update and install required packages
display_message "Updating package list and installing required packages..."
sudo apt update && sudo apt upgrade -y
sudo apt install -y repo git rsync openssl gnutls-bin make

# Initialize and sync the repository
display_message "Initializing the repository..."
repo init -u https://android.googlesource.com/kernel/manifest -b common-android13-5.15

display_message "Synchronizing the repository..."
repo sync

# Access the kernel directory and run the build script
display_message "Looking for kernel_folder_name"
if [ -d "kernel_folder_name" ]; then
    cd kernel_folder_name
    display_message "Running your_script.sh: Construction started..."
    bash your_script.sh
else
    display_message "Directory 'kernel_folder_name' not found. Exiting..."
    exit 1
fi

display_message "Script execution completed successfully."
