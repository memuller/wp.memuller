FROM  webdevops/php-nginx:alpine-php7

ARG   VHOST

USER  root

RUN   usermod -a -G application nginx

COPY  ./docker/nginx/cache.conf /opt/docker/etc/nginx/conf.d/
COPY  ./docker/nginx/vhost.common.d/*.conf /opt/docker/etc/nginx/vhost.common.d/
COPY  ./docker/nginx/vhost.conf /opt/docker/etc/nginx/vhost.conf

RUN   sed -i "s/THESERVERNAME/${VHOST}/g" /opt/docker/etc/nginx/vhost.conf

USER application
COPY ./ /app
