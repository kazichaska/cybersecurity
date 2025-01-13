#!/bin/bash

# Define the backup directory and archive name
BACKUP_DIR="/backup"
TIMESTAMP=$(date +'%Y-%m-%d_%H-%M-%S')
BACKUP_FILE="$BACKUP_DIR/home_backup_$TIMESTAMP.tar.gz"

# Ensure the backup directory exists
sudo mkdir -p "$BACKUP_DIR"

# Create a compressed backup of the /home directory
echo "Creating backup of /home directory..."
sudo tar -czf "$BACKUP_FILE" /home

# Confirm success
if [ $? -eq 0 ]; then
    echo "Backup successful! File saved at: $BACKUP_FILE"
else
    echo "Backup failed!" >&2
fi


#!/bin/bash

# Update the package list
echo "Updating package list..."
sudo apt update

# Upgrade all packages
echo "Upgrading packages..."
sudo apt upgrade -y

# Confirm success
if [ $? -eq 0 ]; then
    echo "System successfully updated and upgraded."
else
    echo "Update failed!" >&2
fi


#!/bin/bash

# Update the package list
echo "Updating package list..."
sudo apt update

# Upgrade all packages
echo "Upgrading packages..."
sudo apt upgrade -y

# Confirm success
if [ $? -eq 0 ]; then
    echo "System successfully updated and upgraded."
else
    echo "Update failed!" >&2
fi



#!/bin/bash

# Remove temporary files
echo "Removing temporary files..."
sudo rm -rf /tmp/*

# Remove thumbnail cache
echo "Cleaning thumbnail cache..."
sudo rm -rf ~/.cache/thumbnails/*

# Clean up apt cache
echo "Cleaning up apt cache..."
sudo apt autoclean
sudo apt autoremove -y

# Confirm success
if [ $? -eq 0 ]; then
    echo "Cleanup completed successfully."
else
    echo "Cleanup failed!" >&2
fi


