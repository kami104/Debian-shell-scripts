#!/bin/bash

# This script sets up a user with sudo privileges, allows passwordless sudo, and disables root SSH login.
# Make sure to run it as root.

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

# Prompt for username
read -p "Enter the username to create: " USERNAME

# Prompt for password and confirmation
while true; do
    read -sp "Enter the password for username $USERNAME: " PASSWORD
    echo  # New line
    read -sp "Confirm the password: " PASSWORD_CONFIRM
    echo  # New line

    if [ "$PASSWORD" == "$PASSWORD_CONFIRM" ]; then
        break
    else
        echo "Passwords do not match. Please try again."
    fi
done

# Create the user with the specified password
if id "$USERNAME" &>/dev/null; then
    echo "User $USERNAME already exists. Skipping user creation."
else
    echo "Creating user $USERNAME..."
    useradd -m -s /bin/bash "$USERNAME"
    echo "$USERNAME:$PASSWORD" | chpasswd
    echo "User $USERNAME created with specified password."
fi

# Add user to the sudo group
echo "Adding $USERNAME to the sudo group..."
usermod -aG sudo "$USERNAME"
echo "$USERNAME has been added to the sudo group."

# Disable root login via SSH
SSH_CONFIG="/etc/ssh/sshd_config"
if grep -q "^PermitRootLogin" "$SSH_CONFIG"; then
    echo "Disabling root login in SSH config..."
    sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' "$SSH_CONFIG"
else
    echo "PermitRootLogin not found. Adding..."
    echo "PermitRootLogin no" >> "$SSH_CONFIG"
fi

# Allow Users in Sudo Group Passwordless Access using visudo safety
SUDOERS_FILE="/etc/sudoers.d/$USERNAME"
echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" | sudo tee "$SUDOERS_FILE" > /dev/null

# Set the correct permissions for the sudoers file
chmod 0440 "$SUDOERS_FILE"

# Use visudo to check the syntax of the sudoers files
visudo -c

# Restart SSH service to apply changes
echo "Restarting SSH service..."
systemctl restart ssh

echo "Setup is complete. The user $USERNAME has been created and configured."
