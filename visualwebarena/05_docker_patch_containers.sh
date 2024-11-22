#!/bin/bash

# stop if any error occur
set -e

source 00_vars.sh

# reddit - make server more responsive
sudo docker exec vwa_forum sed -i \
  -e 's/^pm.max_children = .*/pm.max_children = 32/' \
  -e 's/^pm.start_servers = .*/pm.start_servers = 10/' \
  -e 's/^pm.min_spare_servers = .*/pm.min_spare_servers = 5/' \
  -e 's/^pm.max_spare_servers = .*/pm.max_spare_servers = 20/' \
  -e 's/^;pm.max_requests = .*/pm.max_requests = 500/' \
  /usr/local/etc/php-fpm.d/www.conf
sudo docker exec vwa_forum supervisorctl restart php-fpm

# classifieds
sudo docker exec vwa_classifieds_db mysql -u root -ppassword osclass -e 'source docker-entrypoint-initdb.d/osclass_craigslist.sql'  # Populate DB with content

# shopping
sudo docker exec vwa_shopping /var/www/magento2/bin/magento setup:store-config:set --base-url="http://$PUBLIC_HOSTNAME:$SHOPPING_PORT" # no trailing /
sudo docker exec vwa_shopping mysql -u magentouser -pMyPassword magentodb -e  "UPDATE core_config_data SET value='http://$PUBLIC_HOSTNAME:$SHOPPING_PORT/' WHERE path = 'web/secure/base_url';"
sudo docker exec vwa_shopping /var/www/magento2/bin/magento cache:flush

# Disable re-indexing of products
sudo docker exec vwa_shopping /var/www/magento2/bin/magento indexer:set-mode schedule catalogrule_product
sudo docker exec vwa_shopping /var/www/magento2/bin/magento indexer:set-mode schedule catalogrule_rule
sudo docker exec vwa_shopping /var/www/magento2/bin/magento indexer:set-mode schedule catalogsearch_fulltext
sudo docker exec vwa_shopping /var/www/magento2/bin/magento indexer:set-mode schedule catalog_category_product
sudo docker exec vwa_shopping /var/www/magento2/bin/magento indexer:set-mode schedule customer_grid
sudo docker exec vwa_shopping /var/www/magento2/bin/magento indexer:set-mode schedule design_config_grid
sudo docker exec vwa_shopping /var/www/magento2/bin/magento indexer:set-mode schedule inventory
sudo docker exec vwa_shopping /var/www/magento2/bin/magento indexer:set-mode schedule catalog_product_category
sudo docker exec vwa_shopping /var/www/magento2/bin/magento indexer:set-mode schedule catalog_product_attribute
sudo docker exec vwa_shopping /var/www/magento2/bin/magento indexer:set-mode schedule catalog_product_price
sudo docker exec vwa_shopping /var/www/magento2/bin/magento indexer:set-mode schedule cataloginventory_stock
