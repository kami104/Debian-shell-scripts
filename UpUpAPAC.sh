#!/bin/bash

# This script executes apt update, upgrade, autopurge and autoclean.
# Make sure to run it as root.

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

#Executing UpUpAPAC
apt update
apt upgrade -y
apt autopurge -y
apt autoclean -y

echo "UpUpAPAC is completed."
