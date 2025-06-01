# Debian-shell-scripts
Shell scripts tested in Debian 12 Bookworm


### Use this repository under your own responsability. I'm not a professional programmer, just an ammateur with AI and free time.

## Table of contents:
   - [Script to create a new sudo user and remove root login if it is enabled.](https://github.com/kami104/Debian-shell-scripts/edit/main/README.md#script-to-create-a-new-sudo-user-and-remove-root-login-if-it-is-enabled)
   - [Script UpUpAPAC (Upgrade, Update, AutoPurge, AutoClean](https://github.com/kami104/Debian-shell-scripts/edit/main/README.md#script-to-create-a-new-sudo-user-and-remove-root-login-if-it-is-enabled)

## Script to create a new sudo user and remove root login if it is enabled.

[This script](setup_user_and_sudo.sh)  creates a new user with password. It asks for:
   - The new user name and its password.
  
It also does:
   - Installs sudo
   - Disables the root login if enabled.
   - Adds the new user to the sudoers file in ``/etc/sudoers.d/``
   - Disables the password request when the new sudo user executes a sudo command.

This script can be useful after create a Debian LXC container or after installing a Debian machine where the only user is root and you want to increase security against bad actors trying to gain access (see [this](https://unix.stackexchange.com/questions/82626/why-is-root-login-via-ssh-so-bad-that-everyone-advises-to-disable-it) and [that](https://www.howtogeek.com/124950/htg-explains-why-you-shouldnt-log-into-your-linux-system-as-root/) for more information). 

### You can execute this script as root with the following command:
```bash
bash <(wget -qO- https://raw.githubusercontent.com/kami104/Debian-shell-scripts/refs/heads/main/setup_user_and_sudo.sh)
```
### If you have an RSA key in your ``~/.ssh/`` directory, you can use it to login without password. 

Just execute the following command when you try to login via SSH:
```bash
ssh-copy-id <login_user>@<server_IP>
```
 - Sustitute <login_user> with your username in the server.
 - Sustitute <server_IP> with your server IP or domain

Follow [this guide](https://raspibolt.org/guide/raspberry-pi/security.html#login-with-ssh-keys) for more information about how to create a RSA key.



## Script UpUpAPAC (Upgrade, Update, AutoPurge, AutoClean)

[This script](UpUpAPAC.sh) executes the typical apt update, upgrade, autopurge and autoclean to maintain the machine updated with clean repositories.

### You can execute this script as root with the following command:
```bash
bash <(wget -qO- https://raw.githubusercontent.com/kami104/Debian-shell-scripts/refs/heads/main/UpUpAPAC.sh)
```
