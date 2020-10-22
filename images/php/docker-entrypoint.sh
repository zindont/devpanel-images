#!/bin/bash

# Copy php-fpm.conf to /usr/local/etc/php-fpm.conf
cp /templates/php-fpm.conf /usr/local/etc/php-fpm.conf

# Copy php-fpm.ini template to $PHP_EXT_DIR
cp /templates/php-fpm.ini ${PHP_EXT_DIR}/zz-www.ini

# Substitute in php.ini values
[ ! -z "${PHP_CLEAR_ENV}" ] && sed -i "s|{{PHP_CLEAR_ENV}}|${PHP_CLEAR_ENV}|" ${PHP_EXT_DIR}/zz-www.ini
[ ! -z "${PHP_MEMORY_LIMIT}" ] && sed -i "s|{{PHP_MEMORY_LIMIT}}|${PHP_MEMORY_LIMIT}|" ${PHP_EXT_DIR}/zz-www.ini
[ ! -z "${PHP_UPLOAD_MAX_FILESIZE}" ] && sed -i "s|{{PHP_UPLOAD_MAX_FILESIZE}}|${PHP_UPLOAD_MAX_FILESIZE}|" ${PHP_EXT_DIR}/zz-www.ini
[ ! -z "${PHP_POST_MAX_SIZE}" ] && sed -i "s|{{PHP_POST_MAX_SIZE}}|${PHP_POST_MAX_SIZE}|" ${PHP_EXT_DIR}/zz-www.ini
[ ! -z "${PHP_MAX_EXECUTION_TIME}" ] && sed -i "s|{{PHP_MAX_EXECUTION_TIME}}|${PHP_MAX_EXECUTION_TIME}|" ${PHP_EXT_DIR}/zz-www.ini

# Copy php-xdebug.ini template to $PHP_EXT_DIR
cp /templates/php-xdebug.ini ${PHP_EXT_DIR}/php-xdebug.ini

# Add custom php.ini if it exists
[ -f "$PHP_CUSTOM_INI" ] && cp $PHP_CUSTOM_INI ${PHP_EXT_DIR}/zzz-www-custom.ini

# Turn on bash's job control
set -m

if [[ ! -z "$CODES_ENABLE" ]]; then
# Start the primary process and put it in the background
php-fpm -R &
# Start the helper process
code-server --auth none --port $CODES_PORT --host 0.0.0.0 $CODES_WORKING_DIR
else
# Start the primary process and put it in the background
php-fpm -R
fi

# now we bring the primary process back into the foreground
# and leave it there
fg %1