#!/bin/bash

# This script executes apt update, upgrade, autopurge and autoclean.
# Make sure to run it as root.

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root. Try again starting the command with 'sudo'"
    echo "If that doen't work, try 'apt install sudo' or try to login with the name 'root'" 1>&2
    exit 1
fi

#Executing UpUpAPAC
apt update
apt upgrade -y
apt autopurge -y
apt autoclean -y

echo "UpUpAPAC is completed."
