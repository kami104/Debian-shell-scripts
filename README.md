# Debian-shell-scripts
shell scripts for Debian based OS
### Use this repository under your own responsability. I'm not a professional programmer, just an ammateur.



## Create a new sudo user and remove root login if it is enabled

[This scritp](setup_user_and_sudo.sh)  creates a new user with password. It asks for:
   - The user name and its password.
  
  It also does:
   - Disables the root login
   - Adds the new user to the sudoers file in ``/etc/sudoers.d/``
   - Removes the need to insert the password when the new sudo user executes a sudo command.

You can execute this script as root with the following command:
```bash
bash <(wget -qO- https://raw.githubusercontent.com/kami104/Debian-shell-scripts/refs/heads/main/setup_user_and_sudo.sh)
```
