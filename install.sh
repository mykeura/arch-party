#!/bin/bash
#===============================================================================
# Script Name: install.sh
# Description: This script downloads and installs Arch Party to /usr/local/bin
#
# Author: Miguel Euraque
# Date Created: 2025-09-18
# Version: 1.0
# License: GPLv3 License
#===============================================================================

set -e  # Exit immediately if a command fails

echo "Downloading Arch Party..."

# Create temporary directory
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

# Download the main script from the correct repository
curl -s -O https://raw.githubusercontent.com/mykeura/arch-party/main/arch_party.sh

# Verify that it was downloaded correctly
if [[ ! -f "arch_party.sh" ]]; then
    echo "Error: Could not download arch_party.sh"
    exit 1
fi

# Make the script executable
chmod +x arch_party.sh

# Move to /usr/local/bin with appropriate permissions
sudo install -m 755 arch_party.sh /usr/local/bin/arch-party

# Clean up temporary directory
cd /
rm -rf "$TEMP_DIR"

echo "Arch Party has been installed successfully!"
echo "Run 'arch-party' in your terminal to start the party."
