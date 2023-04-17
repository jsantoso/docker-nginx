#!/bin/bash

  export WEB_DIR=${WEB_DIR:-public}
  export FPM_HOST=${FPM_HOST:-php-fpm}
  export FPM_HOST_2=${FPM_HOST_2:-php-fpm}
  export FPM_HOST_3=${FPM_HOST_3:-php-fpm}
  export FPM_HOST_4=${FPM_HOST_4:-php-fpm}
  export FPM_HOST_5=${FPM_HOST_5:-php-fpm}
  export FPM_HOST_6=${FPM_HOST_6:-php-fpm}
  export FPM_HOST_7=${FPM_HOST_7:-php-fpm}
  export FPM_HOST_8=${FPM_HOST_8:-php-fpm}
  export FPM_HOST_9=${FPM_HOST_9:-php-fpm}

  if [ $FPM_HOST_2 == 'php-fpm' ]; then
      export FPM_HOST_2=${FPM_HOST}
  fi

  if [ $FPM_HOST_3 == 'php-fpm' ]; then
      export FPM_HOST_3=${FPM_HOST}
  fi

  if [ $FPM_HOST_4 == 'php-fpm' ]; then
      export FPM_HOST_4=${FPM_HOST}
  fi

  if [ $FPM_HOST_5 == 'php-fpm' ]; then
      export FPM_HOST_5=${FPM_HOST}
  fi

  if [ $FPM_HOST_6 == 'php-fpm' ]; then
      export FPM_HOST_6=${FPM_HOST}
  fi

  if [ $FPM_HOST_7 == 'php-fpm' ]; then
      export FPM_HOST_7=${FPM_HOST}
  fi

  if [ $FPM_HOST_8 == 'php-fpm' ]; then
      export FPM_HOST_8=${FPM_HOST}
  fi

  if [ $FPM_HOST_9 == 'php-fpm' ]; then
      export FPM_HOST_9=${FPM_HOST}
  fi

  # FPM_HOST env injection - allowing us to set host dynamically on start
  envsubst '${WEB_DIR},${FPM_HOST},${FPM_HOST_2},${FPM_HOST_3},${FPM_HOST_4},${FPM_HOST_5},${FPM_HOST_6},${FPM_HOST_7},${FPM_HOST_8},${FPM_HOST_9}' < /etc/default-fpm.conf > /etc/nginx/conf.d/default.conf

  nginx -g 'daemon off;'