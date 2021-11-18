FROM php:7.2-fpm

ARG GROUP_NAME=hoge
ARG GROUP_ID ${GROUP_ID}
ARG USER_NAME=hoge
ARG USER_ID ${USER_ID}

COPY ./infra/docker/php/php-fpm.d/zz-www.conf /usr/local/etc/php-fpm.d/zz-www.conf
COPY ./infra/docker/php/www.conf /usr/local/etc/php-fpm.d/www.conf

RUN groupadd -g $GROUP_ID $GROUP_NAME && \
       useradd -m -s /bin/bash -u $USER_ID -g $GROUP_ID $USER_NAME

RUN chown -R $USER_NAME:$GROUP_NAME /var/www/html
RUN chmod +x /var/www/html

RUN mkdir /var/run/php-fpm \
       && chown -R $USER_NAME:$GROUP_NAME /var/www/ \
       && chown -R $USER_NAME:$GROUP_NAME /var/run/ \
       && chown -R $USER_NAME:$GROUP_NAME /var/log/

USER $USER_NAME
