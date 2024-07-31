#!/bin/bash

# Credits : @LSEYTHING ON TELEGRAM

# Function to update and install packages
install_packages() {
    echo "Updating package list and installing necessary packages..."
    sudo apt update
    sudo apt upgrade -y
    sudo apt install -y repo git rsync openssl gnutls-bin make
}

# Function to sync and download repository
sync_repository() {
    echo "Syncing repository..."
    repo init -u https://android.googlesource.com/kernel/manifest -b common-android13-5.15
    repo sync
}

# Function to download build.sh
#add your custom build.sh manually on kernel folder.

signed: Lseything
}

# Function to start the kernel build
start_build() {
    echo "Locating your_kernel_folder/build.sh..."
    echo "Running build.sh..."
    bash build.sh
}

# Main script execution
main() {
    install_packages
    sync_repository
    download_build_sh
    start_build
    echo "Your preparation and build finished."
}

main
