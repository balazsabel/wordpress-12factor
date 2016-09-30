#!/bin/bash

# We need to install dependencies only for Docker
[[ ! -e /.dockerenv ]] && [[ ! -e /.dockerinit ]] && exit 0

set -xe

# Install git (the php image doesn't have it) which is required by composer
apt-get update -yqq
apt-get install git -yqq

# Install zip and unzip (required by composer)
apt-get update -yqq
apt-get install zip -yqq
apt-get install unzip -yqq
apt-get install -yqq nodejs npm 
#apt-get install php5-gd -yqq

# Install phpunit, the tool that we will use for testing
curl -Lo /usr/local/bin/phpunit https://phar.phpunit.de/phpunit.phar
chmod +x /usr/local/bin/phpunit

# Install mysql driver
# Here you can install any other extension that you need
docker-php-ext-install pdo_mysql
#docker-php-ext-install gd