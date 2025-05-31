# Debian-shell-scripts
shell scripts for Debian based OS

## [setup_user_and_sudo.sh](setup_user_and_sudo.sh)
  It creates a new user with password. It asks for:
   - The user name and its password.
  
  It also does:
   - Disables the root login
   - Adds the new user to the sudoers file in ``/etc/sudoers.d/``
   - Removes the need to insert the password when the new sudo user executes a sudo command.

