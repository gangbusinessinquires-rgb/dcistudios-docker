#!/bin/bash
cd /home/container

# Make internal Docker IP address available to processes
export INTERNAL_IP=$(ip route get 1 | awk '{print $NF;exit}')

# Replace startup variables
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e "\033[1;33mcontainer@dcistudios~ \033[0m${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
