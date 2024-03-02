FROM nginx:stable

LABEL maintainer="Jeffrey Santoso <jeffrey.k.santoso@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive
ENV TZ=UTC

RUN apt-get update
RUN apt-get upgrade -y
ADD conf/nginx.conf /etc/nginx/nginx.conf
ADD conf/default-fpm.conf /etc/default-fpm.conf

# Path here has to match fpm pathing: mount volumes to /var/www/html
RUN mkdir -p /var/www/html/public \
    && cp /usr/share/nginx/html/index.html /var/www/html/public/

WORKDIR /var/www/html

ADD start.sh /
RUN chmod +x /start.sh

CMD ["/start.sh"]