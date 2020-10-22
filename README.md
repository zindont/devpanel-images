# NGINX Variables
| Variable                   | 1.19.3               |
| -------------------------- | -------------------- |
| NGINX_SERVER_ROOT          | `/var/www/html`      |
| NGINX_VHOST_TYPE           | `php`                |
| NGINX_FPM_HOST             | `0.0.0.0`            |
| NGINX_FPM_PORT             | `9000`               |
| ----                       | ----                 |
| NGINX_CONF_INCLUDE         | `/etc/nginx/conf.d/` |
| NGINX_CLIENT_MAX_BODY_SIZE | `64M`                |

# PHP Variables
| Variable                | 7.4                         |
| ----------------------- | --------------------------- |
| APP_ROOT                | `/var/www/html`             |
| WEB_ROOT                | `$APP_ROOT`                 |
| PHP_CUSTOM_INI          | `$APP_ROOT/php.ini`         |
| ----                    | ----                        |
| PHP_EXT_DIR             | `/usr/local/etc/php/conf.d` |
| PHP_CLEAR_ENV           | `false`                     |
| PHP_MEMORY_LIMIT        | `2G`                        |
| PHP_UPLOAD_MAX_FILESIZE | `64M`                       |
| PHP_POST_MAX_SIZE       | `64M`                       |
| PHP_MAX_EXECUTION_TIME  | `600`                       |

# CODE-SERVER Variables
| Variable          | 3.6.0           |
| ----------------- | --------------- |
| CODES_PORT        | `8080`          |
| CODES_WORKING_DIR | `$APP_ROOT` |
| CODES_ENABLE      | `true`          |
