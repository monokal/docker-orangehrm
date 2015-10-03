#!/bin/bash

# Name:          run.sh
# Description:   Script to run OrangeHRM.
# Maintainer:    Daniel Middleton - d@monokal.io
# Documentation: See README.md
#            -v "${PWD}/data":/var/lib/mysql \

docker run --name orangehrm-db \
            -e MYSQL_ROOT_PASSWORD=rootpass \
            -e MYSQL_DATABASE=orangehrm \
            -e MYSQL_USER=orangehrm \
            -e MYSQL_PASSWORD=orangehrmpass \
            -d mysql:5.5

echo -e "\nWaiting for MySQL...\n"
sleep 10

docker run --name orangehrm-app \
            -p 80:80 \
            --link orangehrm-db:db \
            -v "${PWD}/www":/var/www/html \
            -d php:5.4-apache
