#!/bin/bash

set -e

echo ">>>>>>>>>>>>>> START CUSTOM BUILD SCRIPT <<<<<<<<<<<<<<<<< "
echo "------------------------------------------------------------"
echo "The following build args are available:"
env
echo "------------------------------------------------------------"

RUNTIME_NAME="Python"
RUNTIME_LOGO="python.png"
ARCHIVE_FILE=main

env

curl -sSLO https://github.com/artifakt-io/base-html/archive/refs/heads/${ARCHIVE_FILE}.tar.gz && \
  tar -xzf ${ARCHIVE_FILE}.tar.gz -C /tmp && \
  mv /tmp/${ARCHIVE_FILE}/* /var/www/html && \
  chown -R www-data:www-data /var/www/html && \
  rm ${ARCHIVE_FILE}.tar.gz

sed -i "s/__RUNTIME_NAME__/${RUNTIME_NAME}/" /var/www/html/index.html
sed -i "s/__RUNTIME_LOGO__/${RUNTIME_LOGO}/" /var/www/html/index.html


echo ">>>>>>>>>>>>>> END CUSTOM BUILD SCRIPT <<<<<<<<<<<<<<<<< "
