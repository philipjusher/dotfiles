#!/bin/sh
# Setting permissions on docker.sock
# Get standard cali USER_ID variable

USER_ID=${HOST_USER_ID:-9001}
GROUP_ID=${HOST_GROUP_ID:-9001}
# Change 'me' uid to host user's uid
if [ ! -z "$USER_ID" ] && [ "$(id -u $USER)" != "$USER_ID" ]; then
    # Create a group and add user
    addgroup -g "$GROUP_ID" -s $USER group 
fi

chown $USER /home/$USER
chown $USER /var/run/docker.sock

su $USER
