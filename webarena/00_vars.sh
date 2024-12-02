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

# Original webarena ports
# SHOPPING_PORT=7770
# SHOPPING_ADMIN_PORT=7780
# REDDIT_PORT=9999
# GITLAB_PORT=8023
# WIKIPEDIA_PORT=8888
# MAP_PORT=3000
# HOMEPAGE_PORT=4399

# Port: uupia
# uu: two-digit user number, e.g. 20 -> nick, ..., 21 -> xing, ...
# p: project number, e.g. 0 -> webarena, 1 -> visualwebarena
# i: instance number, e.g. 0 -> instance for model a, 1 -> instance for model b, ...
# a: application number, e.g. 0 -> homepage, 1 -> shopping, 2 -> classifieds, 3 -> reddit, 4 -> wikipedia, ...


HOMEPAGE_PORT=21000
SHOPPING_PORT=21001
CLASSIFIEDS_PORT=21002
REDDIT_PORT=21003
WIKIPEDIA_PORT=21004
RESET_PORT=21009

SHOPPING_URL="http://${PUBLIC_HOSTNAME}:${SHOPPING_PORT}"
SHOPPING_ADMIN_URL="http://${PUBLIC_HOSTNAME}:${SHOPPING_ADMIN_PORT}/admin"
REDDIT_URL="http://${PUBLIC_HOSTNAME}:${REDDIT_PORT}/forums/all"
GITLAB_URL="http://${PUBLIC_HOSTNAME}:${GITLAB_PORT}/explore"
WIKIPEDIA_URL="http://${PUBLIC_HOSTNAME}:${WIKIPEDIA_PORT}/wikipedia_en_all_maxi_2022-05/A/User:The_other_Kiwix_guy/Landing"
MAP_URL="http://${PUBLIC_HOSTNAME}:${MAP_PORT}"

# download the archives from the webarena instructions
# https://github.com/web-arena-x/webarena/tree/main/environment_docker
# Download the additional openstreetmap docker files from Zenodo (see README)
#  - shopping_final_0712.tar
#  - shopping_admin_final_0719.tar
#  - postmill-populated-exposed-withimg.tar
#  - gitlab-populated-final-port8023.tar
#  - openstreetmap-website-db.tar.gz
#  - openstreetmap-website-web.tar.gz
#  - openstreetmap-website.tar.gz
#  - wikipedia_en_all_maxi_2022-05.zim

ARCHIVES_LOCATION="./"
