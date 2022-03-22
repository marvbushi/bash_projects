#! /usr/bin/bash

# Script creates a new user onthe local system.
# Prompted to enter the username, the person name, and a password.
# Username, password, and hostname for the account will be displayed

# Check for superuser priviligies.
if [[ "${UID}" -ne 0 ]]
then
    echo "Please run with sudo or as root"
    exit 1
fi

# Get the username (login).
read -p 'Enter the username >> ' USER_NAME

# Get the real name.
read -p 'Enter the name of the person or application that will be using this account >> ' COMMENT

# Get the password.
read -p 'Enter the pasword for the account >> ' PASSWORD

# Create the account.
useradd -c "${COMMENT}" -m ${USER_NAME}

# Check if the account was created.
if [[ "${?}" -ne 0 ]]
then
    echo 'The account could not be created.'
    exit 1
fi

# Set the password
echo "${USER_NAME}:${PASSWORD}" | chpasswd

if [[ "${?}" -ne 0 ]]
then
    echo 'Unable to set password'
    exit 1
fi

# Force password change on first login.
passwd -e ${USER_NAME}

# Display the username, password, and the host.
echo
echo 'username:'
echo "${USER_NAME}"
echo
echo 'password:'
echo "${PASSWORD}"
echo
echo 'host:'
echo "${HOSTNAME}"
exit 0