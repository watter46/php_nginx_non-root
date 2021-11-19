FROM php:7.2-fpm

COPY ./infra/docker/php/php-fpm.d/zz-www.conf /usr/local/etc/php-fpm.d/zz-www.conf
COPY ./infra/docker/php/www.conf /usr/local/etc/php-fpm.d/www.conf

ARG GROUP_NAME=hoge \
       GROUP_ID ${GROUP_ID} \
       USER_NAME=hoge \
       USER_ID ${USER_ID}

RUN groupadd -g $GROUP_ID $GROUP_NAME && \
       useradd -m -s /bin/bash -u $USER_ID -g $GROUP_ID $USER_NAME && \
       chown -R $USER_NAME:$GROUP_NAME /var/www/html && \
       chmod +x /var/www/html && \
       mkdir /var/run/php-fpm && \
       chown -R $USER_NAME:$GROUP_NAME /var/www/ && \
       chown -R $USER_NAME:$GROUP_NAME /var/run/ && \
       chown -R $USER_NAME:$GROUP_NAME /var/log/

USER $USER_NAME
