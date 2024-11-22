#!/bin/bash

# PUBLIC_HOSTNAME=$(curl -s ifconfig.me)
PUBLIC_HOSTNAME="127.0.0.1"

# Change ports as desired
# CLASSIFIEDS_PORT=8083
# SHOPPING_PORT=8082
# REDDIT_PORT=8080
# WIKIPEDIA_PORT=8081
# HOMEPAGE_PORT=80
# RESET_PORT=7565

# Port: uupia
# uu: two-digit user number, e.g. 20 -> nick, ..., 21 -> xing, ...
# p: project number, e.g. 0 -> webarena, 1 -> visualwebarena
# i: instance number, e.g. 0 -> instance for model a, 1 -> instance for model b, ...
# a: application number, e.g. 0 -> homepage, 1 -> shopping, 2 -> classifieds, 3 -> reddit, 4 -> wikipedia, ...


HOMEPAGE_PORT=21100
SHOPPING_PORT=21101
CLASSIFIEDS_PORT=21102
REDDIT_PORT=21103
WIKIPEDIA_PORT=21104
RESET_PORT=21109

CLASSIFIEDS_URL="http://${PUBLIC_HOSTNAME}:${CLASSIFIEDS_PORT}"
SHOPPING_URL="http://${PUBLIC_HOSTNAME}:${SHOPPING_PORT}"
REDDIT_URL="http://${PUBLIC_HOSTNAME}:${REDDIT_PORT}/forums/all"
WIKIPEDIA_URL="http://${PUBLIC_HOSTNAME}:${WIKIPEDIA_PORT}/wikipedia_en_all_maxi_2022-05/A/User:The_other_Kiwix_guy/Landing"

# Download the archive files from the visualwebarena instructions
# https://github.com/web-arena-x/visualwebarena/tree/main/environment_docker
#  - classifieds_docker_compose.zip
#  - shopping_final_0712.tar
#  - postmill-populated-exposed-withimg.tar
#  - wikipedia_en_all_maxi_2022-05.zim

ARCHIVES_LOCATION="./containers"

export WIKIPEDIA_DATA_DIR="/home/nlp/users/xlu41/scratch/webarena/containers"