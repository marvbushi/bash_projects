#! /usr/bin/bash

# Objectives:
# Display the UID and username of the user exec the script.
# Display if the user is the root user or not.

# What is needed or Pseudocode:
# Display the UID
echo "UID: ${UID}"

# Display if the UID does NOT match 1000
UID_TO_CHECK='1000'

if [[ "${UID}" -ne "$UID_TO_CHECK" ]]
then
    echo "UID does not match ${UID_TO_CHECK}."
    exit 1
fi

# Display the username
USER_NAME=$(id -un)

# Check if $(id -un) command succeeded
if [[ "${?}" -ne 0 ]]
then
    echo 'Failed'
    exit 1
fi

echo "Username: $USER_NAME"

# Display if the user is root or not
: ' if [[ "${UID}" -eq 0 ]] 
then
    echo 'You are root.'
else
    echo 'You are not root.'
fi '

