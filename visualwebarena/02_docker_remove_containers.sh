#!/bin/bash

# stop if any error occur
set -e

sudo docker stop vwa_classifieds_db vwa_classifieds vwa_forum vwa_shopping vwa_wikipedia
sudo docker remove vwa_classifieds_db vwa_classifieds vwa_forum vwa_shopping vwa_wikipedia

