# Debian-shell-scripts
shell scripts for Debian based OS
### Use this repository under your own responsability. I'm not a professional programmer, just an ammateur with AI and free time.

## Create a new sudo user and remove root login if it is enabled script.

[This script](setup_user_and_sudo.sh)  creates a new user with password. It asks for:
   - The user name and its password.
  
  It also does:
   - Disables the root login if enabled.
   - Adds the new user to the sudoers file in ``/etc/sudoers.d/``
   - Removes the need to insert the password when the new sudo user executes a sudo command.

You can execute this script as root with the following command:
```bash
bash <(wget -qO- https://raw.githubusercontent.com/kami104/Debian-shell-scripts/refs/heads/main/setup_user_and_sudo.sh)
```
If you have an RSA key in your ``~/.ssh/`` directory, you can export it to your server with the following command:
```bash
ssh-copy-id <login_user>@<server_IP>
```
Follow [this guide](https://raspibolt.org/guide/raspberry-pi/security.html#login-with-ssh-keys) for more information about how to create a RSA key.
