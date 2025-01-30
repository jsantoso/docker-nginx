#!/bin/bash

  export WEB_DIR=${WEB_DIR:-public}
  export FPM_SERVERS=''

  FPM_PORT=9000
  # Leading white space. \t doesn't work right.
  LWS='    '
  # Line return. \n doesn't work right.
  LR='
  '

  # Gather all environment variables beginning with FPM_HOST
  FPM_HOSTS_VARS=`env | grep '^FPM_HOST'`

  if [[ $FPM_HOSTS_VARS == '' ]]
  then
      # Use 'php-fpm' as the server name if there are no matching env vars.
      FPM_SERVERS="${LWS}server php-fpm:${FPM_PORT}"
  else
      # If there are environment variables starting with FPM_HOST, then create a
      # string that contains all of them, in the right format for the nginx conf.
      for FPM_HOST_VAR in $FPM_HOSTS_VARS
      do
        VALUE=`echo $FPM_HOST_VAR | cut -d '=' -f 2`
        FPM_SERVERS+="${LWS}server ${VALUE}:${FPM_PORT};${LR}"
      done
      # Trim the trailing newline
      FPM_SERVERS=${FPM_SERVERS%$'\n'}
  fi


  # FPM_HOST env injection - allowing us to set host dynamically on start
  envsubst '${WEB_DIR},${FPM_SERVERS}' < /etc/default-fpm.conf > /etc/nginx/conf.d/default.conf

  nginx -g 'daemon off;'