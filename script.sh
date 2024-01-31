#!/bin/bash

# Function to display usage instructions
usage() {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -a, --add-user      Add a new user"
    echo "  -d, --delete-user   Delete a user"
    echo "  -m, --modify-user   Modify user details"
    echo "  -g, --add-group     Add a new group"
    echo "  -r, --remove-group  Remove a group"
    echo "  -b, --backup        Backup a specified directory"
    echo "  -h, --help          Display this help message"
    exit 1
}

# Function to add a new user
add_user() {
    read -p "Enter username: " username
    read -s -p "Enter password for $username: " password
    echo
    sudo useradd -m -p "$(openssl passwd -1 $password)" $username
    echo "User $username added successfully."
}

# Function to delete a user
delete_user() {
    read -p "Enter username to delete: " username
    sudo userdel -r $username
    echo "User $username deleted successfully."
}

# Function to modify user details
modify_user() {
    read -p "Enter username to modify: " old_username
    read -p "Do you want to rename the user? (y/n): " rename_option
    if [ "$rename_option" == "y" ]; then
        read -p "Enter new username: " new_username
        sudo usermod -l $new_username $old_username
        echo "Username updated successfully."
    fi

    read -p "Do you want to add the user to a specific group? (y/n): " add_group_option
    if [ "$add_group_option" == "y" ]; then
        read -p "Enter group name: " groupname
        sudo usermod -a -G $groupname $old_username
        echo "User $old_username added to group $groupname successfully."
    fi
}

# Function to add a new group
add_group() {
    read -p "Enter group name: " groupname
    read -s -p "Enter password for group $groupname: " gpassword
    echo
    sudo groupadd -r -p "$(openssl passwd -1 $gpassword)" $groupname
    echo "Group $groupname added successfully."
}

# Function to remove a group
remove_group() {
    read -p "Enter group name to remove: " groupname
    sudo groupdel $groupname
    echo "Group $groupname removed successfully."
}

# Function to backup a directory
backup_directory() {
    read -p "Enter the directory to backup: " directory
    timestamp=$(date +%Y%m%d%H%M%S)
    sudo tar -czvf "backup_$timestamp.tar.gz" $directory
    echo "Backup completed successfully."
}

# Main script logic using for loop
for option in "$@"; do
    case $option in
        -a|--add-user)
            add_user
            ;;
        -d|--delete-user)
            delete_user
            ;;
        -m|--modify-user)
            modify_user
            ;;
        -g|--add-group)
            add_group
            ;;
        -r|--remove-group)
            remove_group
            ;;
        -b|--backup)
            backup_directory
            ;;
        -h|--help)
            usage
            ;;
        *)
            echo "Invalid option: $option"
            usage
            ;;
    esac
done

# If no options are provided, display usage
if [ "$#" -eq 0 ]; then
    usage
fi

