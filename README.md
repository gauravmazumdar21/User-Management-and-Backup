# Linux System User Management Script

This Bash script provides a user-friendly command-line interface to manage user accounts, groups, and perform backups on a Linux system. The script includes options to add, delete, and modify user accounts, create and manage groups, and perform backups of specified directories.

![Output](https://github.com/gauravmazumdar21/User-Management-and-Backup/blob/main/Output%20Img.PNG)

## Usage
Save this script to a file in Linux system and make it executable using 
```bash
sudo chmod +x script.sh
```
You can then run it with different options to add, delete, or modify users, manage groups, and create backups.
### Adding a New User
```bash
./script.sh -a
```
This option allows you to add a new user. The script will prompt you to enter the username and password for the new user.

### Deleting a User
```bash
./script.sh -d
```
This option allows you to delete an existing user. The script will prompt you to enter the username of the user to be deleted.

### Modifying a User
```bash
./script.sh -m
```
This option allows you to modify an existing user. The script will prompt you to enter the username, and then ask if you want to rename the user or add it to a specific group.

### Adding a New Group
```bash
./script.sh -g
```
This option allows you to add a new group. The script will prompt you to enter the group name and the group password.

### Removing a Group
```bash
./script.sh -r
```
This option allows you to remove an existing group. The script will prompt you to enter the name of the group to be removed.

### Performing a Backup
```bash
./script.sh -b
```
This option allows you to perform a backup of a specified directory. The script will prompt you to enter the directory to be backed up.

### Help
```bash
./script.sh -h
```
This option displays the usage instructions, providing a quick reference for the available options.


## Acknowledgments
- This script is intended for educational purposes and may require further security considerations for production use.
- Feel free to customize and enhance the script based on your specific requirements.

