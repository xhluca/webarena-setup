#!/bin/bash

# stop if any error occur
set -e

source 00_vars.sh

WORKING_DIR=$(pwd)

sudo docker create --name vwa_shopping -p $SHOPPING_PORT:80 shopping_final_0712
sudo docker create --name vwa_forum -p $REDDIT_PORT:80 postmill-populated-exposed-withimg
sudo docker create --name vwa_wikipedia --volume=$WIKIPEDIA_DATA_DIR:/data -p $WIKIPEDIA_PORT:80 ghcr.io/kiwix/kiwix-serve:3.3.0 wikipedia_en_all_maxi_2022-05.zim

cd classifieds_docker_compose/
cp ../classifieds_docker-compose.yml.template docker-compose.yml
sed -i "s|CLASSIFIEDS_PORT|${CLASSIFIEDS_PORT}|g" docker-compose.yml
sed -i "s|CLASSIFIEDS_URL|${CLASSIFIEDS_URL}|g" docker-compose.yml
# also rename container_name: classifieds to vwa_classifieds
sed -i "s|container_name: classifieds|container_name: vwa_classifieds|g" docker-compose.yml
sudo docker compose create --build

