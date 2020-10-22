#!/bin/bash

# Copy nginx.conf
cp /templates/nginx.conf /etc/nginx/nginx.conf
[[ ! -z "$NGINX_CLIENT_MAX_BODY_SIZE" ]] && sed -i "s|{{NGINX_CLIENT_MAX_BODY_SIZE}}|${NGINX_CLIENT_MAX_BODY_SIZE}|" /etc/nginx/nginx.conf
[[ ! -z "$NGINX_CONF_INCLUDE" ]] && sed -i "s|{{NGINX_CONF_INCLUDE}}|${NGINX_CONF_INCLUDE}|" /etc/nginx/nginx.conf

# Copy default.conf to $NGINX_CONF_INCLUDE
cp /templates/$NGINX_VHOST_TYPE-vhost.conf $NGINX_CONF_INCLUDE/default.conf
[[ ! -z "$NGINX_FPM_HOST" ]] && sed -i "s|{{NGINX_FPM_HOST}}|${NGINX_FPM_HOST}|" $NGINX_CONF_INCLUDE/default.conf
[[ ! -z "$NGINX_FPM_PORT" ]] && sed -i "s|{{NGINX_FPM_PORT}}|${NGINX_FPM_PORT}|" $NGINX_CONF_INCLUDE/default.conf
[[ ! -z "$NGINX_SERVER_ROOT" ]] && sed -i "s|{{NGINX_SERVER_ROOT}}|${NGINX_SERVER_ROOT}|" $NGINX_CONF_INCLUDE/default.conf

# Check Syntax
nginx -t;

# Launch nginx
nginx -g "daemon off;"
