#!/bin/bash

# stop if any error occur
set -e

source 00_vars.sh

# 1. make sure requests to HOSTNAME are made to the local ip (avoid firewall issues)

# HOSTNAME_REDIRECT="127.0.0.1 ${PUBLIC_HOSTNAME}"
# # Check if the redirect hack already exists in /etc/hosts
# if ! grep -Fxq "$HOSTNAME_REDIRECT" /etc/hosts; then
#     # If the redirect hack doesn't exist, append it to /etc/hosts
#     echo "Applying redirect hack to /etc/hosts"
#     echo "${HOSTNAME_REDIRECT}" | tee -a /etc/hosts
# else
#     echo "Redirect already in /etc/hosts, skipping"
#     echo "${HOSTNAME_REDIRECT}"
# fi

# 2. start the containers

sudo docker start vwa_shopping
sudo docker start vwa_forum
sudo docker start vwa_wikipedia

cd classifieds_docker_compose/
sudo docker compose start

echo -n -e "Waiting 60 seconds for all services to start..."
sleep 60
echo -n -e " done\n"

