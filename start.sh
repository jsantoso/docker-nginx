#!/bin/bash

  export WEB_DIR=${WEB_DIR:-public}
  export FPM_HOST=${FPM_HOST:-php-fpm}

  # FPM_HOST env injectin - allowing us to set host dynamically on start
  envsubst '${WEB_DIR},${FPM_HOST}' < /etc/default-fpm.conf > /etc/nginx/conf.d/default.conf

  nginx -g 'daemon off;'