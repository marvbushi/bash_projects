#! /usr/bin/bash

# Creates an account on the local system.
# Prompt the user for the account name and password

# Prompt for the user name
read -p 'Enter the username: ' USER_NAME

# Prompt for the real name
read -p 'Enter your real name: ' COMMENT

# Prompt for the password
read -p 'Enter the account password: ' PASSWORD

# Create the user
useradd -c "${COMMENT}" -m ${USER_NAME}

# Set the password
#echo ${PASSWORD} | passwd --stdin ${USER_NAME}
echo  "${USER_NAME}:${PASSWORD}" | chpasswd #${USER_NAME}

# Force password change on first login
passwd -e ${USER_NAME}