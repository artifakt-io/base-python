#!/bin/bash

set -e

echo ">>>>>>>>>>>>>> START CUSTOM BUILD SCRIPT <<<<<<<<<<<<<<<<< "
echo "------------------------------------------------------------"
echo "The following build args are available:"
env
echo "------------------------------------------------------------"

RUNTIME_NAME="Python"
RUNTIME_LOGO="python.png"
ARCHIVE_FILE=static-page-main

env

curl -sSLO https://gitlab.com/djalal/static-page/-/archive/main/${ARCHIVE_FILE}.tar.gz && \
  tar -xzf ${ARCHIVE_FILE}.tar.gz -C /tmp && \
  mv /tmp/${ARCHIVE_FILE}/* /var/www/html && \
  chown -R www-data:www-data /var/www/html && \
  rm ${ARCHIVE_FILE}.tar.gz

sed -i "s/__RUNTIME_NAME__/${RUNTIME_NAME}/" /var/www/html/index.html
sed -i "s/__RUNTIME_LOGO__/${RUNTIME_LOGO}/" /var/www/html/index.html


echo ">>>>>>>>>>>>>> END CUSTOM BUILD SCRIPT <<<<<<<<<<<<<<<<< "
